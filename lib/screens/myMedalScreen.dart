import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sossi_app/components/double_value_pair.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';

import '../components/challenge_block.dart';
import '../components/medal_block.dart';
import '../constants.dart';

class MyMedalScreen extends StatefulWidget {
  const MyMedalScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyMedalScreenState createState() => _MyMedalScreenState();
}

class _MyMedalScreenState extends State<MyMedalScreen> {
  @override
  Widget build(BuildContext context) {
    var dWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              border: Border.all(
                color: Theme.of(context).backgroundColor,
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                        child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
            child: Text(
              "Medals".toUpperCase(),
              style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: Constants.medals.length,
            prototypeItem: MedalBlock(
              title: Constants.medals.first.title,
              desc: Constants.medals.first.desc,
              icon: Constants.medals.first.icon,
            ),
            itemBuilder: (context, index) {
              return MedalBlock(
                  icon: Constants.medals[index].icon,
                  title: Constants.medals[index].title,
                  desc: Constants.medals[index].desc);
            },
          ))
        ],
      ),
    );
  }
}
