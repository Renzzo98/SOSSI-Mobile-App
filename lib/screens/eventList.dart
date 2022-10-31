import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sossi_app/screens/createEventScreen.dart';
import 'package:sossi_app/screens/eventDetailScreen.dart';
import '../constants.dart';
import '../model/Event.dart';

import "package:sossi_app/constants.dart";
import 'package:shared_preferences/shared_preferences.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  late List<Event> events = Constants.events;
  late bool isLoading = true;

  Future<void> fetchEvents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.reload();
    await prefs.setString("events", Event.encode(events));
    final String? eventListString = prefs.getString('events');
    if (eventListString != null) {
      setState(() {
        events = Event.decode(eventListString!);
      });
    }
    loaded();
  }

  void loaded() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    List<Event> events = Constants.events;
    fetchEvents();
    isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
          child: CircularProgressIndicator(
        color: Theme.of(context).backgroundColor,
      ));
    }
    // ignore: unnecessary_new
    return new Scaffold(
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      body: ListView.builder(
        itemCount: events.length,
        padding: const EdgeInsets.all(12.0),
        itemBuilder: (BuildContext c, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/detailEvent',
                    arguments: Event(
                        name: events[index].name,
                        description: events[index].description,
                        date: events[index].date,
                        latitude: events[index].latitude,
                        longitude: events[index].longitude,
                        dateStart: events[index].dateStart,
                        dateEnd: events[index].dateEnd,
                        orgID: events[index].orgID,
                        orgName: events[index].orgName,
                        rsvpNum: events[index].rsvpNum,
                        rating: events[index].rating,
                        eventID: events[index].eventID,
                        isOngoing: events[index].isOngoing));
              },
              child: Card(
                  child: Column(children: [
                ListTile(
                  leading: const Icon(
                    Icons.event_note,
                    size: 30,
                  ),
                  title: Text(events[index].name),
                  subtitle: Text(events[index].orgName),
                  trailing: events[index].isOngoing
                      ? Icon(
                          Icons.event_available,
                          color: Theme.of(context).primaryColor,
                        )
                      : const Icon(
                          Icons.event_busy,
                          color: Colors.redAccent,
                        ),
                )
              ])));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateEventScreen()),
          ).then((value) => fetchEvents());
        },
      ),
    );
  }
}
