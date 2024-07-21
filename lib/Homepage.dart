import 'package:flutter/material.dart';
import 'package:test_app/FirstPage.dart';
import 'package:test_app/SecondPage.dart';
import 'package:test_app/third_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int current_index = 0;
  _selectItem(int index){
    setState(() {
      current_index=index;
    });
  }
  final List<AppBar> _childAppbar=[
    AppBar(
  backgroundColor: Colors.blue,
  foregroundColor: Colors.white,
  toolbarHeight: 150,
  centerTitle: false,
  shape: const RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(
  bottom: Radius.circular(30),
  ),
  ),
  title: const Row(
  children: [
  Expanded(
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  SizedBox(height: 50, child: Icon(Icons.arrow_back_ios)),
  SizedBox(height: 50, child: Text('Search courses', style: TextStyle(fontSize: 15))),
  SizedBox(height: 50, child: Text('Type Something...')),
  ],
  ),
  ),
  Column(
  children: [
  Icon(Icons.search),
  ],
  ),
  ],
  ),
  ),
    AppBar(
      leading: const Icon(Icons.arrow_back_ios),
      title: const Text('Recommended',style: TextStyle(fontSize: 30.0),),
      toolbarHeight: 90,
      centerTitle: true,
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    ),
    AppBar(
      leading: const Icon(Icons.arrow_back_ios),
      title: const Text('Third Navigation'),
      toolbarHeight: 100,
      foregroundColor: Colors.greenAccent,
    )
  ];
  final List<Widget> _childBody=[
    const Firstpage(),
    const Secondpage(),
    const ThirdPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _childAppbar[current_index],
      body: _childBody[current_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 4.0,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.star_border),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.door_back_door_outlined),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: ''),
        ],
        unselectedItemColor: Colors.grey[400],
        selectedItemColor: Colors.grey[1000],
        selectedFontSize: 22.0,
        currentIndex: current_index,
        onTap: _selectItem,
      ),
    );
  }
}
