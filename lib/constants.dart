import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'model/Event.dart';
import 'model/Medal.dart';

class Constants {
  static const String loginName = "Welcome";
  static const String orgName = "Organizer";
  static const String regName = "Register";
  static const String logoTag = "-Insert tag-";
  static const String titleTag = "-Insert tag-";
  static const String event1 = 'Event 1';
  static const String event2 = 'Event 2';
  static const String event3 = 'Event 3';

  static const CameraPosition marker1 = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition marker2 = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static const CameraPosition marker3 = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static List<Event> events = [
    Event(
      name: event1,
      description: event1,
      date: "Oct",
      latitude: 51.49220688011474,
      longitude: -0.010424728835688258,
      dateStart: new DateTime(2022),
      dateEnd: new DateTime(2022),
      orgID: '1',
      orgName: 'Big Brother Org',
      rsvpNum: 23,
      rating: 2,
      eventID: '1',
      isOngoing: true,
    ),
    Event(
      name: event2,
      description: event2,
      date: "Oct",
      latitude: 51.48224483913322,
      longitude: -0.0020602538668872154,
      dateStart: new DateTime(2022),
      dateEnd: new DateTime(2022),
      orgID: '1',
      orgName: 'Big Brother Org',
      rsvpNum: 47,
      rating: 4,
      eventID: '2',
      isOngoing: false,
      RSVP: true,
    ),
    Event(
        name: event3,
        description: event3,
        date: "Oct",
        latitude: 51.48341910685281,
        longitude: -0.0034896543528867992,
        dateStart: new DateTime(2022),
        dateEnd: new DateTime(2022),
        orgID: '2',
        orgName: 'SOSSI',
        rsvpNum: 11,
        rating: 2,
        eventID: '3',
        isOngoing: false,
        RSVP: true),
  ];

  static List<Medal> medals = [
    Medal(
        title: 'Commuter',
        desc: 'Attend your 5th Event',
        icon: CategoryConstants.commuter),
    Medal(
        title: 'Did you hear the news?',
        desc: 'Share an event to others',
        icon: CategoryConstants.connect),
    Medal(
        title: 'Share the love',
        desc: 'Add an comment to a event',
        icon: CategoryConstants.enlightenment),
    Medal(
        title: 'Giving Back',
        desc: 'Attend your first event',
        icon: CategoryConstants.handshake),
    Medal(
        title: 'Welcome Wagon',
        desc: 'Create your profile. Welcome to the team!',
        icon: CategoryConstants.medal),
  ];
}

class CategoryConstants {
  static const IconData community =
      IconData(0xe2eb, fontFamily: 'MaterialIcons');
  static const IconData event = IconData(0xe23e, fontFamily: 'MaterialIcons');
  static const IconData star = IconData(0xe5f9, fontFamily: 'MaterialIcons');
  static const IconData rsvp = IconData(0xe545, fontFamily: 'MaterialIcons');
  static const IconData group = IconData(0xe2eb, fontFamily: 'MaterialIcons');
  static const IconData medal = IconData(0xf05ae, fontFamily: 'MaterialIcons');
  static const IconData connect = IconData(0xe187, fontFamily: 'MaterialIcons');
  static const IconData commuter =
      IconData(0xe233, fontFamily: 'MaterialIcons');
  static const IconData handshake =
      IconData(0xf06be, fontFamily: 'MaterialIcons');
  static const IconData enlightenment =
      IconData(0xe56f, fontFamily: 'MaterialIcons');
}
