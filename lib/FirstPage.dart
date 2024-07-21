import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
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
      ),);
  }
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


