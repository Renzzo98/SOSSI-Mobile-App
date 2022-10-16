import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ChallengeBlock extends StatefulWidget {
  const ChallengeBlock({
    Key? key,
    required this.category,
    required this.title,
    required this.comp,
  }) : super(key: key);

  final IconData category;
  final String title;
  final bool comp;

  @override
  _ChallengeBlockState createState() => _ChallengeBlockState();
}

class _ChallengeBlockState extends State<ChallengeBlock> {
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
    var isComplete = widget.comp;
    var iconCategory = widget.category;
    var challengeTitle = widget.title;

    return Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
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
              child: Icon(iconCategory),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 20,
                  width: dWidth / 2 + 20,
                  child: AutoSizeText(
                    challengeTitle,
                    maxLines: 1,
                    maxFontSize: 20,
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            isComplete
                ? const Icon(Icons.check_circle)
                : const Icon(Icons.radio_button_unchecked)
          ],
        ));
  }
}
