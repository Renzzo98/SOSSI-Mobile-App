// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../constants.dart';
import '../model/Event.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: LatLng(51.49251273004651, -0.010537408777957719),
            zoom: 14.4746),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          getMarker(Constants.events[0]),
          getMarker(Constants.events[1]),
          getMarker(Constants.events[2]),
        },
      ),
    );
  }

  Marker getMarker(Event event) {
    BitmapDescriptor iconType = event.RSVP
        ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)
        : BitmapDescriptor.defaultMarker;
    return Marker(
        markerId: MarkerId(event.eventID),
        position: LatLng(event.latitude, event.longitude),
        infoWindow: InfoWindow(
          title: event.name,
          snippet: event.RSVP ? 'RSVP: True' : 'RSVP: False',
          onTap: () => Navigator.of(context).pushNamed('/detailEvent',
              arguments: Event(
                  name: event.name,
                  description: event.description,
                  date: event.date,
                  latitude: event.latitude,
                  longitude: event.longitude,
                  dateStart: event.dateStart,
                  dateEnd: event.dateEnd,
                  orgID: event.orgID,
                  orgName: event.orgName,
                  rsvpNum: event.rsvpNum,
                  rating: event.rating,
                  eventID: event.eventID,
                  isOngoing: event.isOngoing)),
        ),
        icon: iconType);
  }
}
