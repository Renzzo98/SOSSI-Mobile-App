import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/Event.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  bool isLoading = false;

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
        itemCount: Constants.events.length,
        padding: const EdgeInsets.all(12.0),
        itemBuilder: (BuildContext c, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/detailEvent',
                    arguments: Event(
                        name: Constants.events[index].name,
                        description: Constants.events[index].description,
                        date: Constants.events[index].date,
                        latitude: Constants.events[index].latitude,
                        longitude: Constants.events[index].longitude,
                        dateStart: Constants.events[index].dateStart,
                        dateEnd: Constants.events[index].dateEnd,
                        orgID: Constants.events[index].orgID,
                        orgName: Constants.events[index].orgName,
                        rsvpNum: Constants.events[index].rsvpNum,
                        rating: Constants.events[index].rating,
                        eventID: Constants.events[index].eventID,
                        isOngoing: Constants.events[index].isOngoing));
              },
              child: Card(
                  child: Column(children: [
                ListTile(
                  leading: const Icon(
                    Icons.event_note,
                    size: 30,
                  ),
                  title: Text(Constants.events[index].name),
                  subtitle: Text(Constants.events[index].orgName),
                  trailing: Constants.events[index].isOngoing
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
          Navigator.of(context).pushNamed("/createEvent");
        },
      ),
    );
  }
}
