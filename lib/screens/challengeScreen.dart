import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sossi_app/components/double_value_pair.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';

import '../components/challenge_block.dart';
import '../constants.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  @override
  Widget build(BuildContext context) {
    var dWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                        ))
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text(
                  "Challenges".toUpperCase(),
                  style: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: dWidth - 20,
                    height: dWidth / 2 - 20,
                    decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        border: Border.all(
                          color: Theme.of(context).backgroundColor,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const AutoSizeText(
                            "Welcome\nMonth",
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: dWidth / 2 - 50,
                            child: const Divider(
                              color: Colors.white,
                            ),
                          ),
                          const AutoSizeText(
                            "02/03/22 - 03/01/22",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SquarePercentIndicator(
                            width: 80,
                            height: 80,
                            startAngle: StartAngle.topLeft,
                            reverse: false,
                            borderRadius: 12,
                            shadowWidth: 1.5,
                            progressWidth: 5,
                            shadowColor: Colors.grey,
                            progressColor: Colors.white,
                            progress: 0.54,
                            child: Center(
                                child: Text(
                              "54 %",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Your Progress",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )),
          Divider(),
          const ChallengeBlock(
            category: CategoryConstants.community,
            comp: false,
            title: 'Attend 2 Events',
          ),
          const ChallengeBlock(
            category: CategoryConstants.event,
            comp: true,
            title: 'Favorite an Event',
          ),
        ],
      ),
    );
  }
}
