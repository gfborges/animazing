import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CreateTask extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateTaskState();
  }
}

class _CreateTaskState extends State<CreateTask> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController timeCtl = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  var moneyController = new MoneyMaskedTextController(leftSymbol: 'R\$ ');

  TimeOfDay time;
  TimeOfDay picked;
  DateTime date = DateTime.now();

  String valueChoose;
  List listItem = ["Não repete", "Todos os dias", "Semanal", "Mensal", "Anual"];
  String petChoose;
  List listItemPet = ["Galileu", "King Kong", "Rex"];

  //Time picker
  void initState() {
    super.initState();
    time = TimeOfDay.now();
  }

  Future<Null> selectTime(BuildContext) async {
    picked = await showTimePicker(context: context, initialTime: time);

    if (picked != null) {
      setState(() {
        time = picked;
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
                  onChanged: (newValue) {
                    setState(() {
                      petChoose = newValue;
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
                decoration: InputDecoration(
                    labelText: 'Título da tarefa',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
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
                  value: valueChoose,
                  icon: Icon(Icons.arrow_drop_down_circle),
                  isExpanded: true,
                  underline: SizedBox(),
                  onChanged: (newValue) {
                    setState(() {
                      valueChoose = newValue;
                    });
                  },
                  items: listItem.map((valueItem) {
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
                    return 'Data cannot be empty';
                  }
                  return null;
                },
                keyboardType: TextInputType.datetime,
                controller: dateCtl,
                onTap: () {
                  selectDate(context);
                },
                decoration: InputDecoration(
                    labelText: 'Data',
                    hintText: 'DD/MM/YYYY',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
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
