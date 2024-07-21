import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const Home(),
    const Favorites(),
    const Door(),
    const Profile(),
  ];

  final List<AppBar> _childAppbar = [
    AppBar(
      title: const Text('Home Appbar'),
      backgroundColor: Colors.blue,
    ),
    AppBar(
      title: const Text('Favorites Appbar'),
      backgroundColor: Colors.red,
    ),
    AppBar(
      title: const Text('Door Appbar'),
      backgroundColor: Colors.green,
    ),
    AppBar(
      title: const Text('Profile Appbar'),
      backgroundColor: Colors.orange,
    ),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _childAppbar[_currentIndex],
      body: _children[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 60, // Adjust the height here
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          elevation: 4.0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.door_back_door_outlined),
              label: 'Door',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Screen', style: TextStyle(fontSize: 24)),
    );
  }
}

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Favorites Screen', style: TextStyle(fontSize: 24)),
    );
  }
}

class Door extends StatelessWidget {
  const Door({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Door Screen', style: TextStyle(fontSize: 24)),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Screen', style: TextStyle(fontSize: 24)),
    );
  }
}
