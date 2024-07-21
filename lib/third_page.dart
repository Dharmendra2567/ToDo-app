import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
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
    Colors.blue.withAlpha(30),
    Colors.lightBlue,
    ],
    sizeFactor: 0.40,
    opacity: 70,
    paintingStyle: PaintingStyle.fill,
    shape: BubbleShape.circle,
    speed: BubbleSpeed.normal,

    ),
    )]);
  }
}
