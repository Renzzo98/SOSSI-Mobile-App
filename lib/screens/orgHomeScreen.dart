import 'package:flutter/material.dart';

import 'eventList.dart';
import 'mapScreen.dart';
import 'orgProfileScreen.dart';
import 'sdgScreen.dart';

class OrgHomeScreen extends StatefulWidget {
  const OrgHomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OrgHomeScreenState createState() => _OrgHomeScreenState();
}

class _OrgHomeScreenState extends State<OrgHomeScreen> {
  int _selectedIndex = 0;

  void changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getCurrentSubwidget() {
    if (_selectedIndex == 0) {
      return const OrgProfile();
    } else if (_selectedIndex == 1) {
      return const EventList();
    } else if (_selectedIndex == 2) {
      return const ChooseSDGList();
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
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Events"),
        ],
        onTap: changeIndex,
      ),
    );
  }
}
