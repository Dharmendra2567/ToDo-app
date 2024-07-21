import 'package:flutter/material.dart';
import 'package:test_app/Recommended.dart';

class AnnimationDemo extends StatefulWidget {
  const AnnimationDemo({super.key});

  @override
  State<AnnimationDemo> createState() => _AnnimationDemoState();
}

class _AnnimationDemoState extends State<AnnimationDemo> {
  int current_index = 0;
  _selectItem(int index){
    setState(() {
      current_index=index;
    });
    if(current_index==1){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Recommended()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
      child :Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Featured'),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('View All'),
                ),
              ],
            ),
          ),
          // Featured courses
          const SizedBox(height: 12), // Adding some spacing
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buildCard(context),
                buildCard(context),
                buildCard(context),
                buildCard(context),
              ],
            ),
          ),
          //buisness courses
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Buisness'),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('View All'),
                ),

              ],
            ),
          ),
          const SizedBox(height: 7), // Adding some spacing
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buildCard(context),
                buildCard(context),
                buildCard(context),
                buildCard(context),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Development'),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('View All'),
                ),

              ],
            ),
          ),
          const SizedBox(height: 7), // Adding some spacing
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buildCard(context),
                buildCard(context),
                buildCard(context),
                buildCard(context),
              ],
            ),
          ),
        ],
      ),),
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

  Widget buildCard(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width / 3 - 30; // Adjust to fit 3 cards
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: cardWidth,
        child: Card(
          color: Colors.lightBlue[100],
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/sample_image.jpg'), // Replace with your image
                      radius: 25.0,
                    ),
                    SizedBox(width: 16.0),
                  ],
                ),
                SizedBox(height: 0.0),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Description text goes here.',
                    style: TextStyle(fontSize: 13.0),
                  ),
                ),
                Text(
                  'show more',
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(
  home: AnnimationDemo(),
));
