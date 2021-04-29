import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: OutlinedButton(
        onPressed: () async {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
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
              "Cadastrar conta",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.values[3],
                  color: Color(0xff837676)),
            ),
          ),
        ),
      ),
    );
  }
}
