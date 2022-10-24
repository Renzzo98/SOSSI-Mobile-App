// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:sossi_app/model/Event.dart';

import '../constants.dart';
import '../users.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  TextEditingController dateinput = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String startDateString = "";
  String endDateString = "";
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventDescController = TextEditingController();
  TextEditingController startDateController =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController endDateController =
      TextEditingController(text: DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen[50],
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: eventNameController,
                decoration: const InputDecoration(
                  hintText: 'Event Name',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: eventDescController,
                decoration: const InputDecoration(
                  hintText: 'Event Description',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              DateTimePicker(
                  type: DateTimePickerType.dateTime,
                  initialValue: DateTime.now().toString(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  // controller: startDateController,
                  icon: Icon(Icons.event),
                  dateLabelText: 'Start Date for Event',
                  validator: (val) {
                    setState(() => startDateString = val ?? '');
                    if (val == null || val.isEmpty) {
                      return "Please enter a start date";
                    }
                    return null;
                  }),
              DateTimePicker(
                  type: DateTimePickerType.dateTime,
                  initialValue: DateTime.now().toString(),
                  icon: Icon(Icons.event),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  // controller: endDateController,
                  dateLabelText: 'End Date for Event',
                  validator: (val) {
                    setState(() => endDateString = val ?? '');
                    if (val == null || val.isEmpty) {
                      return "Please enter a stop date";
                    }
                    return null;
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Event(
                          name: eventNameController.text,
                          description: eventDescController.text,
                          dateStart: DateTime.parse(startDateString),
                          dateEnd: DateTime.parse(endDateString));
                      //Send it off
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ));
  }
}
