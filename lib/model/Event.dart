//looked at Event.java from demo

import 'dart:convert';
import 'SDG.dart';

class Event {
  Event(
      {required this.name,
      required this.description,
      required this.orgName,
      required this.orgID,
      required this.dateStart,
      required this.dateEnd,
      this.date = "",
      this.latitude = 0,
      this.longitude = 0,
      this.eventID = '',
      required this.rsvpNum,
      required this.rating,
      this.isOngoing = true,
      this.sdgs = const [],
      this.RSVP = false,
      this.tags = const []});

  bool RSVP;
  DateTime dateStart;
  DateTime dateEnd;
  String name;
  String description;
  String orgName;
  String orgID;
  double latitude;
  double longitude;
  int rsvpNum;
  int rating;
  String eventID;
  List<SDG> sdgs;
  List<String> tags;
//  String startTime; //string for now, but should be datetime
//  String endTime; //string for now, but should be datetime
  String date; //string for now, but should be datetime
  bool isOngoing;

  void setEventID(String eventID) {
    this.eventID = eventID;
  }

  void isRSVPed(bool RSVP) {
    this.RSVP = RSVP;
  }

  Map<String, dynamic> toJsonDict() {
    Map<String, dynamic> jsonDict = {};
    jsonDict["name"] = name;
    jsonDict["description"] = description;
    jsonDict["id"] = eventID;
//    print(this.dateStart);
    if (dateStart != null) {
      jsonDict["startDate"] = dateStart.toIso8601String();
    }
    if (dateEnd != null) {
      jsonDict["endDate"] = dateEnd.toIso8601String();
    }
    jsonDict["latitude"] = latitude;
    jsonDict["longitude"] = longitude;
    if (sdgs != null) {
      jsonDict["sdg"] = [];
      for (SDG sdg_item in sdgs) {
        jsonDict["sdg"].add({"id": sdg_item.id});
      }
    }
    json["orgName"] = orgName;
    json["orgId"] = orgId;
    jsonDict["rsvpNum"] = rsvpNum;
    jsonDict["rating"] = rating;
    return jsonDict;
  }

  static String encode(List<Event> events) => json.encode(
        events
            .map<Map<String, dynamic>>((event) => event.toJsonDict())
            .toList(),
      );

  static List<Event> decode(String events) =>
      (json.decode(events) as List<dynamic>)
          .map<Event>((item) => Event.fromJson(item))
          .toList();

  void jsonParse(Map<String, dynamic> rawData) {
    name = rawData["name"];
    eventID = rawData["id"].toString();
    if (rawData["startDate"] != null && rawData["startDate"] != null) {
      dateStart = DateTime.parse(rawData["startDate"]);
      dateEnd = DateTime.parse(rawData["endDate"]);
    }
    latitude = rawData["latitude"];
    longitude = rawData["longitude"];
    description = rawData["description"];
    rsvpNum = rawData["rsvpNum"];
    rating = rawData["rating"];
    tags = [];
    if (rawData.containsKey("tags")) {
      for (int i = 0; i < rawData["tags"].length; i++) {
        tags.add(rawData["tags"][i].toString());
      }
    }
    if (rawData.containsKey("sdg")) {
      for (int i = 0; i < rawData["sdg"].length; i++) {}
    }
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        name: json["name"],
        description: json["description"],
        eventID: json["id"],
        dateStart: DateTime.now(),
        dateEnd: DateTime.now(),
        latitude: json["latitude"],
        longitude: json["longitude"],
        rating: json["rating"],
        rsvpNum: json["rsvpNum"],
        orgID: json["orgId"],
        orgName: json["orgName"]);
  }

  static Map<String, dynamic> toMap(Event event) => {
        'name': event.name,
        'description': event.description,
        'orgName': event.orgName,
        'orgId': event.orgID,
        'dateStart': event.dateStart,
        'dateEnd': event.dateEnd,
        'rsvpNum': event.rsvpNum,
        'rating': event.rating
      };
}
