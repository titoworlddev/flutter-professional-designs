import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  @override
  Widget build(BuildContext context) {
    final rnd = Random();
    final r = rnd.nextInt(255);
    final g = rnd.nextInt(255);
    final b = rnd.nextInt(255);

    final height = rnd.nextInt(300).toDouble() + 70;
    final width = rnd.nextInt(300).toDouble() + 70;

    final r2 = rnd.nextInt(255);
    final g2 = rnd.nextInt(255);
    final b2 = rnd.nextInt(255);

    final borderRadius = BorderRadius.circular(rnd.nextInt(100).toDouble());
    final border = Border.all(
        width: rnd.nextInt(20).toDouble() + 2,
        color: Color.fromRGBO(r2, g2, b2, 1));

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: const Icon(
          Icons.play_arrow,
        ),
        onPressed: () {
          setState(() {});
        },
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1500),
          curve: Curves.elasticOut,
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Color.fromRGBO(r, g, b, 1),
              borderRadius: borderRadius,
              border: border),
        ),
      ),
    );
  }
}
