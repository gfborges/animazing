import 'package:animazing/Models/User.dart';
import 'package:animazing/Services/UserService.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Animazing'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome'),
                ElevatedButton(
                    child: Text('LOGIN'),
                    onPressed: () {
                      User user = userService.getOne("test-user");
                      Navigator.of(context).pushNamed('/app', arguments: user);
                    })
              ],
            ),
          )),
    );
  }
}
