import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';

class UiHelper {


  static courseCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 150,
            width: 100,
            color: Colors.blue,

          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Data Science',
                        style: TextStyle(fontSize: 24, color: Colors.blue),),
                      SizedBox(height: 5,),
                      Text('3 coins')
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'sub-heading here', style: TextStyle(fontSize: 12.0,),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    'Unlock the power of data with our comprehensive Data Science course. '
                        'Gain practical skills in Python, machine learning,',
                    style: TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Register here')),
                      ElevatedButton(onPressed: () {},
                          child: const Text('See more details'))
                    ],
                  )

                ],
              ),
            ),
          ),
        ],
      ),);
  }

  static CustomButton(VoidCallback voidCallback, String text,
      MaterialColor btnColor) {
    return ElevatedButton(onPressed: () {
      voidCallback();
    }, style: ElevatedButton.styleFrom(
        backgroundColor: btnColor[100], foregroundColor: btnColor[900]
    ), child: Text(text),);
  }

  static bubbling() {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Colors.red,
          ),
        ),
        Positioned.fill(
          child: FloatingBubbles.alwaysRepeating(
            noOfBubbles: 25,
            colorsOfBubbles: [
              Colors.green.withAlpha(30),
              Colors.red,
            ],
            sizeFactor: 0.16,
            opacity: 70,
            paintingStyle: PaintingStyle.fill,
            shape: BubbleShape.square,
            speed: BubbleSpeed.normal,

          ),
        )
      ],);
  }
}
