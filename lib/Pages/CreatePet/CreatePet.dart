import 'package:animazing/Models/Pet.dart';
import 'package:animazing/Models/PetBuilder.dart';
import 'package:animazing/Models/Pets.dart';
import 'package:animazing/Services/OwnerService.dart';
import 'package:animazing/widgets/ScreenTitle.dart';
import 'package:flutter/material.dart';
import 'package:animazing/Extensions/StringExtension.dart';

class CreatePet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreatePetState();
  }
}

class _CreatePetState extends State<CreatePet> {
  final _formKey = GlobalKey<FormState>();
  final ownerService = OwnerService.get();
  final petBuilder = PetBuilder();

  String origemChoose;
  List listOrigem = ["Adotado", "Comprado"];

  Pets specieChoose;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: <Widget>[
            Center(child: ScreenTitle(text: 'Pets')), // Título da tela
            Center(
                child: ScreenSubTitle(
                    text: 'Adicione um pet a sua lista')), // Subtítulo
            Center(child: Image.asset('images/sleeping_cat.png')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Nome cannot be empty';
                  }
                  return null;
                },
                onChanged: (name) => this.petBuilder.setName(name),
                decoration: InputDecoration(
                    labelText: 'Nome do pet',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 15.0, bottom: 15.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: DropdownButtonFormField(
                  hint: Text('Espécie'),
                  value: specieChoose,
                  icon: Icon(Icons.arrow_drop_down_circle),
                  isExpanded: true,
                  decoration: InputDecoration.collapsed(hintText: ''),
                  validator: (value) => value == null ? "Espécie cannot be empty" : null,
                  onChanged: (value) {
                    setState(() {
                      specieChoose = value;
                      this.petBuilder.setType(value);
                    });
                  },
                  items: Pets.values.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem.toString().split('.').last.capitalize()),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 15.0, bottom: 15.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: DropdownButtonFormField(
                  hint: Text('Origem'),
                  value: origemChoose,
                  icon: Icon(Icons.arrow_drop_down_circle),
                  isExpanded: true,
                  decoration: InputDecoration.collapsed(hintText: ''),
                  validator: (value) => value == null ? "Origem cannot be empty" : null,
                  onChanged: (value) {
                    setState(() {
                      origemChoose = value;
                      this.petBuilder.setOrigin(value);
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
                padding: EdgeInsets.symmetric(vertical: 17, horizontal: 60),
                child: Text("Cadastrar", style: TextStyle(color: Colors.white)),
                color: Color(0xff4a4356),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Pet p = this.petBuilder.get();
                    this.ownerService.addPet(p);
                    _formKey.currentState.reset();
                    origemChoose = null;
                    specieChoose = null;
                    showDialog(context: context, builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('Pet cadastrado com sucesso!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pushNamed("/app");
                            },
                            child: Text('Continuar'),
                          ),
                        ],
                      ); 
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
