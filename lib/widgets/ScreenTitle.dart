import 'package:flutter/material.dart';
import 'package:animazing/colors.dart';

class ScreenTitle extends StatelessWidget {
  // atributos
  final String text;

  // construtor
  ScreenTitle({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(this.text,
        style: TextStyle(fontSize: 48, fontWeight: FontWeight.values[2]));
  }
}

class ScreenSubTitle extends StatelessWidget {
  // atributos
  final String text;

  // construtor
  ScreenSubTitle({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        color: subtitle_color,
        fontWeight: FontWeight.values[5],
      ),
    );
  }
}
