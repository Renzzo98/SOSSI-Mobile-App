import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class MedalBlock extends StatefulWidget {
  const MedalBlock({
    Key? key,
    required this.icon,
    required this.title,
    required this.desc,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String desc;

  @override
  _MedalBlockState createState() => _MedalBlockState();
}

class _MedalBlockState extends State<MedalBlock> {
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
    var iconPic = widget.icon;
    var medalTitle = widget.title;
    var descBody = widget.desc;

    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Container(
            width: dWidth - 50,
            height: dWidth / 3,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              border: Border.all(
                color: Theme.of(context).colorScheme.tertiary,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(3, 8), // changes position of shadow
                ),
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      border: Border.all(
                        color: Theme.of(context).backgroundColor,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Icon(iconPic),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        medalTitle,
                        maxLines: 1,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: dWidth / 2,
                        child: AutoSizeText(
                          descBody,
                          maxLines: 4,
                        ),
                      )
                    ],
                  )
                ]),
          ),
        ));
  }
}
