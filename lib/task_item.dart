
class TaskItem{
  late int id;
   String name;
   bool isDone=false;

  TaskItem({
    required this.id,
    required this.name,
    required this.isDone,
  });
}
List<TaskItem> taskItems=[
  TaskItem(id:01,name: 'Team Meeting',isDone:false),
  TaskItem(id:02,name: 'Team work',isDone:false),
  TaskItem(id:03,name: 'Market Studying',isDone:true),
  TaskItem(id:07,name: 'Team Play',isDone:false),

];