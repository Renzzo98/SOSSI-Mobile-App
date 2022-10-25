//looked at Event.java from demo

import 'dart:convert';
import 'package:flutter/cupertino.dart';

class Medal {
  Medal({
    required this.title,
    required this.desc,
    required this.icon,
  });

  String title;
  String desc;
  IconData icon;
}
