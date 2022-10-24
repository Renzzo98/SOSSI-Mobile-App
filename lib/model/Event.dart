//looked at Event.java from demo

import 'dart:convert';
import 'SDG.dart';

class Event {
  Event(
      {required this.name,
      required this.description,
      required this.dateStart,
      required this.dateEnd,
      this.date = "",
      this.latitude = 0,
      this.longitude = 0,
      this.eventID = '',
      this.isOngoing = true,
      this.sdgs = const [],
      this.RSVP = false,
      this.tags = const []});

  bool RSVP;

  DateTime dateStart;
  DateTime dateEnd;
  String name;
  String description;
  double latitude;
  double longitude;
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
    jsonDict["name"] = this.name;
    jsonDict["description"] = this.description;
    jsonDict["id"] = this.eventID;
//    print(this.dateStart);
    if (this.dateStart != null) {
      jsonDict["startDate"] = this.dateStart.toIso8601String();
    }
    if (this.dateEnd != null) {
      jsonDict["endDate"] = this.dateEnd.toIso8601String();
    }
    jsonDict["latitude"] = this.latitude;
    jsonDict["longitude"] = this.longitude;
    if (sdgs != null) {
      jsonDict["sdg"] = [];
      for (SDG sdg_item in sdgs) {
        jsonDict["sdg"].add({"id": sdg_item.id});
      }
    }
    return jsonDict;
  }

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
    tags = [];
    if (rawData.containsKey("tags")) {
      for (int i = 0; i < rawData["tags"].length; i++) {
        tags.add(rawData["tags"][i].toString());
      }
    }
    if (rawData.containsKey("sdg")) {
      for (int i = 0; i < rawData["sdg"].length; i++) {}
    }
//    if (rawData.containsKey(""))
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        name: json["name"],
        eventID: json["id"],
        dateStart: json["startDate"],
        dateEnd: json["endDate"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        description: json["description"],
        date: json["date"],
        isOngoing: json["isOngoing"]);
  }
}
