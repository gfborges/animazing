import 'package:animazing/Models/Owner.dart';
import 'package:animazing/Models/Task.dart';
import 'package:animazing/Models/TaskBuilder.dart';
import 'package:animazing/Models/Frequency.dart';
import 'package:animazing/Models/TaskCategory.dart';
import 'package:animazing/Services/TaskService.dart';
import 'package:animazing/Store/Store.dart';
import 'package:animazing/widgets/ScreenTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CreateTask extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateTaskState();
  }
}

// TODO: fazer a tela ficar responsiva
class _CreateTaskState extends State<CreateTask> {
  final _formKey = GlobalKey<FormState>();
  final TaskBuilder taskBuilder = TaskBuilder();
  TextEditingController timeCtl = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  TextEditingController titleCtl = TextEditingController();
  var moneyController = new MoneyMaskedTextController(leftSymbol: 'R\$ ');
  TimeOfDay time;
  TimeOfDay picked;
  DateTime date = DateTime.now();
  Owner currentOwner;
  TaskService taskService;

  String chosenFreq;
  List frequencies = Frequency.values.map((e) => e.toLabel()).toList();
  String petChoose;
  List<String> listItemPet;
  List<String> categories = [
    "Entreterimento",
    "Comida",
    "Saúde",
    "Higiene",
    "Outro"
  ];
  String choosenCat;

  //Time picker
  void initState() {
    super.initState();
    time = TimeOfDay.now();
  }

  _CreateTaskState() {
    this.currentOwner = Store.memory["currentOwner"];
    this.taskBuilder.setOwner(this.currentOwner.id);
    this.taskService = TaskService();
    this.listItemPet = this.currentOwner.pets.map((pet) => pet.name).toList();
    this.categories = TaskCategory.values.map((e) => e.toLabel()).toList();
  }

  Future<Null> selectTime(BuildContext context) async {
    picked = await showTimePicker(context: context, initialTime: time);

    if (picked != null) {
      setState(() {
        time = picked;
        taskBuilder.setTime(time.format(context));
        timeCtl.text = time.format(context);
      });
    }
  }

  //Date picker
  Future<Null> selectDate(BuildContext) async {
    final DateTime datePicked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: date,
        lastDate: DateTime(2030));

    if (datePicked != null) {
      setState(() {
        date = datePicked;
        dateCtl.text = date.day.toString() +
            '/' +
            date.month.toString() +
            '/' +
            date.year.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Center(child: ScreenTitle(text: 'Tarefas')), // Título da tela
            Center(
                child: ScreenSubTitle(
                    text: 'Agende uma tarefa para ser lembrado')), // Subtítulo
            Center(child: Image.asset('images/notebook.png')),
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
                  hint: Text('Pet'),
                  value: petChoose,
                  icon: Icon(Icons.arrow_drop_down_circle),
                  isExpanded: true,
                  underline: SizedBox(),
                  onChanged: (newPet) {
                    setState(() {
                      taskBuilder.setPet(newPet);
                      petChoose = newPet;
                    });
                  },
                  items: listItemPet.map((valueItem) {
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
              child: TextFormField(
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Título cannot be empty';
                  }
                  return null;
                },
                controller: titleCtl,
                decoration: InputDecoration(
                  labelText: 'Título da tarefa',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                onChanged: (String title) {
                  taskBuilder.setName(title);
                },
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
                  hint: Text('Categoria'),
                  value: choosenCat,
                  icon: Icon(Icons.arrow_drop_down_circle),
                  isExpanded: true,
                  underline: SizedBox(),
                  onChanged: (newCat) {
                    setState(() {
                      taskBuilder.setCategory(newCat);
                      choosenCat = newCat;
                    });
                  },
                  items: categories.map((valueItem) {
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
              child: TextFormField(
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Horário cannot be empty';
                  }
                  return null;
                },
                controller: timeCtl,
                onTap: () {
                  selectTime(context);
                },
                decoration: InputDecoration(
                    labelText: 'Horário',
                    hintText: '00:00',
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
                  hint: Text('Frequência'),
                  value: chosenFreq,
                  icon: Icon(Icons.arrow_drop_down_circle),
                  isExpanded: true,
                  underline: SizedBox(),
                  onChanged: (newFreq) {
                    setState(() {
                      taskBuilder.setFrequency(newFreq);
                      chosenFreq = newFreq;
                    });
                  },
                  items: frequencies.map((valueItem) {
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
              child: TextFormField(
                controller: dateCtl,
                onTap: () {
                  selectDate(context);
                },
                decoration: InputDecoration(
                    labelText: 'Data',
                    hintText: 'DD/MM/YYYY',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                    onChanged: (newDate) => taskBuilder.setDate(dateCtl.text),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Gasto cannot be empty';
                  }
                  return null;
                },
                onChanged: (String value) {
                  print(moneyController.numberValue);
                  taskBuilder.setCost(moneyController.numberValue);
                },
                controller: moneyController,
                decoration: InputDecoration(
                    labelText: 'Gasto',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 17, horizontal: 60),
                child: Text("Cadastrar"),
                color: Color(0xffef8766),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                onPressed: () async  {
                  if (_formKey.currentState.validate()) {
                    taskBuilder.setDate(dateCtl.text);
                    Task task = taskBuilder.get();
                    await taskService.save(task);
                    
                    afterSave();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void afterSave() {
    clear();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('Tarefa cadastrada com sucesso!'),
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

  void clear() {
    timeCtl.clear();
    dateCtl.clear();
    moneyController.clear();
    titleCtl.clear();
  }
}
