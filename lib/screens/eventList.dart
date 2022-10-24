import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sossi_app/screens/createEventScreen.dart';
import 'package:sossi_app/screens/eventDetailScreen.dart';
import '../model/Event.dart';

import "package:sossi_app/constants.dart";

List<Event> fetchEvents(fun) {
  fun();
  return Constants.events;
}

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  late final List<Event> events;
  late bool isLoading = true;

  void loaded() {
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    events = fetchEvents(loaded);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
          child: CircularProgressIndicator(
        color: Theme.of(context).backgroundColor,
      ));
    } else {
      // ignore: unnecessary_new
      return new Scaffold(
        appBar: AppBar(
          title: const Text("Events"),
        ),
        backgroundColor: Colors.lightGreen[50],
        resizeToAvoidBottomInset: false,
        body: ListView.builder(
          itemCount: events.length,
          padding: const EdgeInsets.all(12.0),
          itemBuilder: (BuildContext c, int index) {
            return GestureDetector(
                onTap: () {
                  print("tapped card");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EventDetailScreen()),
                  );
                },
                child: Card(
                    child: Column(children: [
                  ListTile(leading: Text(events[index].name))
                ])));
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreateEventScreen()),
            );
          },
        ),
      );
    }
  }
}
