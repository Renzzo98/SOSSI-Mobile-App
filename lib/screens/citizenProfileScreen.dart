import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sossi_app/components/double_value_pair.dart';

class CitizenProfile extends StatefulWidget {
  const CitizenProfile({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CitizenProfileState createState() => _CitizenProfileState();
}

class _CitizenProfileState extends State<CitizenProfile> {
  @override
  Widget build(BuildContext context) {
    var dWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            // A fixed-height child.
            height: 250.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              border: Border.all(
                color: Theme.of(context).backgroundColor,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: IconButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed("/main"),
                          icon: const Icon(
                            Icons.military_tech,
                            color: Colors.white,
                            size: 30,
                          ),
                        ))
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                      child: Icon(
                        Icons.person_search,
                        color: Colors.white,
                        size: 65,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 180,
                            child: AutoSizeText(
                              "Johnny Smithson",
                              maxLines: 1,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 180,
                            child: AutoSizeText(
                              "testingEmail@yahoo.com",
                              maxLines: 1,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                // Remove this as a component as a value pair
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      DoubleValuePair(
                        paddingSize: 20,
                        brightness: true,
                        value1: "8",
                        value2: "Stats 1",
                      ),
                      DoubleValuePair(
                        paddingSize: 20,
                        brightness: true,
                        value1: "13",
                        value2: "Stats 2",
                      ),
                      DoubleValuePair(
                        paddingSize: 20,
                        brightness: true,
                        value1: "4",
                        value2: "Stats 3",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: 80.0,
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
                  children: const [
                    Icon(
                      Icons.workspace_premium,
                      size: 50,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.workspace_premium,
                      size: 50,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.workspace_premium,
                      size: 50,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.workspace_premium,
                      size: 50,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.workspace_premium,
                      size: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
              )),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: Size(dWidth - 20, 40),
            ),
            child: Text(
              "EDIT DETAILS",
              style: TextStyle(
                  fontSize: 16, color: Theme.of(context).backgroundColor),
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: Size(dWidth - 20, 40),
            ),
            child: Text(
              "ABOUT SDG",
              style: TextStyle(
                  fontSize: 16, color: Theme.of(context).backgroundColor),
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: Size(dWidth - 20, 40),
            ),
            child: Text(
              "EDIT DETAILS",
              style: TextStyle(
                  fontSize: 16, color: Theme.of(context).backgroundColor),
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: Size(dWidth - 20, 40),
            ),
            child: Text(
              "ABOUT SDG",
              style: TextStyle(
                  fontSize: 16, color: Theme.of(context).backgroundColor),
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: Size(dWidth - 20, 40),
            ),
            child: Text(
              "EDIT DETAILS",
              style: TextStyle(
                  fontSize: 16, color: Theme.of(context).backgroundColor),
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: Size(dWidth - 20, 40),
            ),
            child: Text(
              "ABOUT SDG",
              style: TextStyle(
                  fontSize: 16, color: Theme.of(context).backgroundColor),
            ),
          ),
        ],
      )),
    );
  }
}
