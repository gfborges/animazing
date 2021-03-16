import 'package:flutter/material.dart';

class CreatePet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreatePetState();
  }
}

class _CreatePetState extends State<CreatePet> {
  final _formKey = GlobalKey<FormState>();

  String origemChoose;
  List listOrigem = ["Adotado", "Comprado"];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: 50.0,
          horizontal: 10.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Nome cannot be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Nome do pet',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Espécie cannot be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Espécie do pet',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 7.0, bottom: 7.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: DropdownButton(
                    hint: Text('Origem'),
                    value: origemChoose,
                    icon: Icon(Icons.arrow_drop_down_circle),
                    isExpanded: true,
                    underline: SizedBox(),
                    onChanged: (newValue) {
                      setState(() {
                        origemChoose = newValue;
                      });
                    },
                    items: listOrigem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  child: Text("Cadastrar"),
                  color: Colors.grey,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  onPressed: () {
                    _formKey.currentState.validate();
                  },
                ),
              ),
            ],
          ),
        ),
      );
  }
}
