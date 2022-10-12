import 'package:flutter/material.dart';

import 'citizenProfileScreen.dart';
import 'eventList.dart';
import 'mapScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getCurrentSubwidget() {
    if (_selectedIndex == 0) {
      return const EventList();
    } else if (_selectedIndex == 1) {
      return const MapScreen();
    } else if (_selectedIndex == 2) {
      return const CitizenProfile();
    } else {
      return const Center(child: Text("Setting Page will be here"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getCurrentSubwidget(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "Events",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Profile"),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.settings), title: Text("Settings")
//          )
        ],
        onTap: changeIndex,
      ),
    );
  }
}
