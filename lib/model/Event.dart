import 'dart:convert';
import 'SDG.dart';

class Event {
  Event(
      {required this.name,
      required this.description,
      required this.address,
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
  String address;
  String orgName;
  String orgID;
  double latitude;
  double longitude;
  int rsvpNum;
  int rating;
  String eventID;
  List<SDG> sdgs;
  List<String> tags;
  String date;
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
    jsonDict["address"] = address;
    jsonDict["orgID"] = orgID;
    jsonDict["orgName"] = orgName;
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
    jsonDict["rsvpNum"] = rsvpNum;
    jsonDict["isOngoing"] = isOngoing;
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
    address = rawData["address"].toString();
    orgID = rawData["orgID"].toString();
    orgName = rawData["orgName"].toString();
    description = rawData["description"];
    rsvpNum = rawData["rsvpNum"];
    isOngoing = rawData["isOngoing"];
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
        address: json["address"],
        dateStart: DateTime.parse(json['startDate']),
        dateEnd: DateTime.parse(json['endDate']),
        latitude: json["latitude"],
        longitude: json["longitude"],
        rating: json["rating"],
        rsvpNum: json["rsvpNum"],
        isOngoing: json["isOngoing"],
        orgID: json["orgID"],
        orgName: json["orgName"]);
  }

  static Map<String, dynamic> toMap(Event event) => {
        'name': event.name,
        'description': event.description,
        'address': event.address,
        'orgName': event.orgName,
        'orgID': event.orgID,
        'dateStart': event.dateStart,
        'dateEnd': event.dateEnd,
        'rsvpNum': event.rsvpNum,
        'isOngoing': event.isOngoing,
        'rating': event.rating
      };
}
