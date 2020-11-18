import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.red;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_outline),
        onPressed: () => _playAnimation(),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),
          duration: Duration(milliseconds: 750),
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }

  _playAnimation() {
    final random = Random();

    setState(() {

      // Modifica Alto y Ancho
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();

      // Modifica el color
      _color = Color.fromRGBO(
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
          1);

      // Modifica las esquinas redondeadas
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    }); // setState
  } // _playAnimation


}
