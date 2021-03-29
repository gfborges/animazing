import 'package:flutter/material.dart';
import 'package:animazing/colors.dart';

/* 
  Background da telas do app
  Configura a cor, degradê e o padding da tela
*/

class Background extends StatelessWidget {
  final Widget screen;
  const Background({
    Key key,
    @required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: new BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.2,
              0.95,
            ],
            colors: [
              medium_purple,
              light_purple,
            ]),
      ),
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: screen, // tela que vai ser carregada
          ),
        ],
      ),
    );
  }
}
