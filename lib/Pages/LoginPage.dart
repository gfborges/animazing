import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
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
                      Navigator.of(context).pushNamed(
                        '/app',
                      );
                    })
              ],
            ),
          )),
    );
  }
}
