import 'package:animazing/Models/User.dart';
import 'package:animazing/Pages/Login/components/Authentication.dart';
import 'package:animazing/Pages/Login/components/SignInWithGoogleButton.dart';
import 'package:animazing/Pages/Login/components/CreateAccountButton.dart';
import 'package:animazing/Services/UserService.dart';
import 'package:animazing/widgets/ScreenTitle.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(-4.0, -8.0),
              end: Alignment(3.0, 6.0),
              stops: [
                0.2,
                0.75,
              ],
              colors: [
                Color(0xfff1dbdb),
                Color(0xfffaf7f7),
              ]),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 50),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScreenTitle(text: "Animazing"),
                    ScreenSubTitle(
                      text: "Torne o carinho com seus pets ainda mais incrível",
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                      child: Image.network(
                        "https://i.pinimg.com/originals/9f/13/ae/9f13ae857448aad272655220144012e3.png",
                        width: 300,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: FutureBuilder(
                    future: Authentication.initializeFirebase(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("Ocorreu um erro ao inicializar Firebase");
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return Column(
                          children: [
                            SignInWithGoogleButton(),
                            CreateAccountButton(),
                          ],
                        );
                      }
                      return CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.orange,
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}