import 'package:flutter/material.dart';

import '../model/Event.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  bool isLoading = true;
  late List<Event> events;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
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
                Navigator.of(context)
                    .pushNamed('/eventDetails', arguments: events[index]);
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
          Navigator.of(context).pushNamed("/createEvent");
        },
      ),
    );
  }
}
