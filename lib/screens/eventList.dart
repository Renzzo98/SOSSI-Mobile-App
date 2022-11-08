import 'package:flutter/material.dart';
import 'package:sossi_app/screens/createEventScreen.dart';
import 'package:grouped_list/grouped_list.dart';
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
        events = Event.decode(eventListString);
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
      body: Column(
        children: [
          Container(
              height: 80.0,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Events".toUpperCase(),
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ))),
          Expanded(
            child: GroupedListView<dynamic, String>(
              elements: events,
              groupBy: (element) => element.dateStart.year.toString(),
              groupComparator: (value1, value2) => value2.compareTo(value1),
              itemComparator: (item1, item2) =>
                  item1.dateStart.year.compareTo(item2.dateStart.year),
              order: GroupedListOrder.DESC,
              reverse: false,
              useStickyGroupSeparators: false,
              groupSeparatorBuilder: (String value) => Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              itemBuilder: (c, element) {
                return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/detailEvent',
                          arguments: Event(
                              name: element.name,
                              description: element.description,
                              date: element.date,
                              latitude: element.latitude,
                              longitude: element.longitude,
                              dateStart: element.dateStart,
                              dateEnd: element.dateEnd,
                              address: element.address,
                              orgID: element.orgID,
                              orgName: element.orgName,
                              rsvpNum: element.rsvpNum,
                              rating: element.rating,
                              eventID: element.eventID,
                              isOngoing: element.isOngoing));
                    },
                    child: Card(
                        child: Column(children: [
                      ListTile(
                        leading: const Icon(
                          Icons.event_note,
                          size: 30,
                        ),
                        title: Text(element.name),
                        subtitle: Text(element.orgName),
                        trailing: element.isOngoing
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
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateEventScreen()),
          );
          print("should fetch now");
          fetchEvents();
        },
      ),
    );
  }
}
