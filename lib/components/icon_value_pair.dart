import 'package:flutter/material.dart';

class IconValuePair extends StatefulWidget {
  const IconValuePair({
    Key? key,
    required this.paddingSize,
    required this.brightness,
    required this.value,
    required this.category,
  }) : super(key: key);

  final double paddingSize;
  final bool brightness;
  final String value;
  final IconData category;

  @override
  _IconValuePairState createState() => _IconValuePairState();
}

class _IconValuePairState extends State<IconValuePair> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var brightnessColor = widget.brightness ? Colors.white : Colors.black;
    var valueStr = widget.value;
    var iconCategory = widget.category;

    return Padding(
      padding: EdgeInsets.all(widget.paddingSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            iconCategory,
            color: Colors.white,
            size: 30,
          ),
          Text(
            valueStr,
            style: TextStyle(
              color: brightnessColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
