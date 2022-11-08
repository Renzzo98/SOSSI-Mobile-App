import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sossi_app/components/double_value_pair.dart';
import 'package:sossi_app/model/Event.dart';

import '../components/comment_block.dart';
import '../components/icon_value_pair.dart';
import '../constants.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final parameters = ModalRoute.of(context)!.settings.arguments as Event;
    var ratingNum = parameters.rating.toString();

    var dWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            // A fixed-height child.
            height: 230.0,
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
                  mainAxisAlignment: MainAxisAlignment.start,
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
                        ))
                  ],
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(dWidth - 20, 40),
                    side: const BorderSide(width: 0.5, color: Colors.white),
                  ),
                  child: Text(
                    parameters.orgName,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                        child: Column(
                          children: const [
                            Icon(
                              Icons.business_center,
                              color: Colors.white,
                              size: 65,
                            ),
                            AutoSizeText(
                              "Business",
                              maxLines: 1,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 180,
                            child: AutoSizeText(
                              parameters.name,
                              maxLines: 1,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 180,
                            child: AutoSizeText(
                              parameters.address,
                              maxLines: 2,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
              height: 60.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconValuePair(
                      paddingSize: 10,
                      brightness: true,
                      value: parameters.rsvpNum.toString(),
                      category: CategoryConstants.group,
                    ),
                    IconValuePair(
                      paddingSize: 10,
                      brightness: true,
                      value: '$ratingNum/5',
                      category: CategoryConstants.star,
                    )
                  ],
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(dWidth / 2 - 20, 40),
                ),
                child: Text(
                  "RSVP",
                  style: TextStyle(
                      fontSize: 16, color: Theme.of(context).backgroundColor),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(dWidth / 2 - 20, 40),
                ),
                child: Text(
                  "RATE",
                  style: TextStyle(
                      fontSize: 16, color: Theme.of(context).backgroundColor),
                ),
              ),
            ],
          ),
          const Divider(),
          CommentBlock(
            message: "I can't wait to go to this event!",
            timestamp: DateTime.parse("2023-02-03"),
            username: "LongTimeUser120",
          ),
          CommentBlock(
            message: "This is a test message.",
            timestamp: DateTime.parse("2023-02-03"),
            username: "FamilyMan88",
          ),
          CommentBlock(
            message:
                "This is a test message. But I need to stress test this comment input to ensure it can properly handle a long comment like this right?? This is a test message.",
            timestamp: DateTime.parse("2023-02-03"),
            username: "BigUser404",
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add Comment'),
        onPressed: () {},
        icon: const Icon(Icons.comment),
      ),
    );
  }
}
