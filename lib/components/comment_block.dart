import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CommentBlock extends StatefulWidget {
  const CommentBlock({
    Key? key,
    required this.timestamp,
    required this.username,
    required this.message,
  }) : super(key: key);

  final DateTime timestamp;
  final String username;
  final String message;

  @override
  _CommentBlockState createState() => _CommentBlockState();
}

class _CommentBlockState extends State<CommentBlock> {
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
    var dWidth = MediaQuery.of(context).size.width;
    var user = widget.username;
    var comment = widget.message;
    var dateTime = widget.timestamp;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  border: Border.all(
                    color: Theme.of(context).backgroundColor,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            SizedBox(
                height: 80,
                width: dWidth - 100,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        user,
                        maxLines: 1,
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // To-Do: Fix the formatting for DateTime using intl
                      AutoSizeText(
                        dateTime.toIso8601String(),
                        maxLines: 1,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AutoSizeText(
                        comment,
                        maxFontSize: 40,
                        maxLines: 2,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }
}
