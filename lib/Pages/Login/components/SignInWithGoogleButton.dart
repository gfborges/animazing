import 'package:animazing/Models/Owner.dart';
import 'package:animazing/Pages/Login/components/Authentication.dart';
import 'package:animazing/Repositories/TaskRepository.dart';
import 'package:animazing/Services/UserService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInWithGoogleButton extends StatelessWidget {
  OwnerService ownerService = OwnerService.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: OutlinedButton(
        onPressed: () async {
          User user = await Authentication.signInWithGoogle(context: context);
          if (user != null) {
            print(user.displayName);
            var owner = Owner.create(user);
            ownerService.currentUser = owner;
            Navigator.of(context).pushNamed('/app', arguments: Owner.create(user));
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xff837676)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: Center(
            child: Text(
              "Fazer login com Google",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.values[2],
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
