import 'package:flutter/material.dart';
import 'task_item.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  List<TaskItem> _filteredTaskItems = [];

  @override
  void initState() {
    super.initState();
    _filteredTaskItems = List.from(taskItems);
    _searchController.addListener(_filterTasks);
  }

  void addTask(String todoItem) {
    setState(() {
      final newTask = TaskItem(
        id: taskItems.length + 1,
        name: todoItem,
        isDone: false,
      );
      taskItems.insert(0, newTask);
      _filteredTaskItems = List.from(taskItems);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('ToDo item added successfully'),
          action: SnackBarAction(
            label: 'ok',
            onPressed: () {},
          ),
        ),
      );
    });
  }

  void removeTask(int id, int index) {
    String undoName = '';
    bool undoIsDone = false;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure to delete this item?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  TaskItem? removedItem = taskItems.firstWhere((element) => element.id == id);
                  if (removedItem.id != 0) {
                    undoName = removedItem.name;
                    undoIsDone = removedItem.isDone;
                    taskItems.remove(removedItem);
                  }
                  _filterTasks();
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('item deleted successfully'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        handleUndo(TaskItem(id: id, name: undoName, isDone: undoIsDone), index);
                      },
                    ),
                  ),
                );
              },
              child: Text('Ok'),
              style: ElevatedButton.styleFrom(foregroundColor: Colors.red),
            ),
          ],
        );
      },
    );
  }

  void handleUndo(TaskItem todoItem, int index) {
    setState(() {
      taskItems.insert(index, todoItem);
      _filterTasks();
    });
  }

  void _filterTasks() {
    setState(() {
      if (_searchController.text.isEmpty) {
        _filteredTaskItems = List.from(taskItems);
      } else {
        _filteredTaskItems = taskItems
            .where((task) => task.name.toLowerCase().contains(_searchController.text.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('TODOLIST'),
        backgroundColor: Colors.grey,
        toolbarHeight: 50,
        centerTitle: true,
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/Dharmendra.jpg'),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'ALL ToDos',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredTaskItems.length,
              itemBuilder: (context, index) {
                final TaskItem taskItem = _filteredTaskItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Card(
                    child: Container(
                      height: 60, // Set height for the card
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: taskItem.isDone,
                            onChanged: (bool? value) {
                              setState(() {
                                taskItem.isDone = value!;
                              });
                            },
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                taskItem.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  decoration: taskItem.isDone
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ), // Center text
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              removeTask(taskItem.id, index);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              shape: const ContinuousRectangleBorder(),
                            ),
                            child: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(20.0),
                      hintText: 'Add new ToDo task',
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.0,
                          style: BorderStyle.solid,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    String newTask = _taskController.text;
                    if (newTask.isNotEmpty) {
                      addTask(newTask);
                      _taskController.clear();
                    }
                  },
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ToDoApp(),
  ));
}
