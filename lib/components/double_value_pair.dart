import 'package:flutter/material.dart';

class DoubleValuePair extends StatefulWidget {
  const DoubleValuePair({
    Key? key,
    required this.paddingSize,
    required this.brightness,
    required this.value1,
    required this.value2,
  }) : super(key: key);

  final double paddingSize;
  final bool brightness;
  final String value1;
  final String value2;

  @override
  _DoubleValuePairState createState() => _DoubleValuePairState();
}

class _DoubleValuePairState extends State<DoubleValuePair> {
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
    var value1 = widget.value1;
    var value2 = widget.value2;

    return Padding(
      padding: EdgeInsets.all(widget.paddingSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value1,
            style: TextStyle(
                color: brightnessColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Text(
            value2,
            style: TextStyle(
                color: brightnessColor,
                fontSize: 12,
                fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
