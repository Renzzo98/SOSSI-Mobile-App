import 'package:flutter/material.dart';

class OrgProfile extends StatefulWidget {
  const OrgProfile({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OrgProfileState createState() => _OrgProfileState();
}

class _OrgProfileState extends State<OrgProfile> {
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
            height: 150.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                border: Border.all(
                  color: Theme.of(context).backgroundColor,
                ),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                      child: Icon(
                        Icons.business,
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
                            child: Text(
                              "Johnny Smithson",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 180,
                            child: Text(
                              "testingEmail@yahoo.com",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
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
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: dWidth - 20,
              height: dWidth / 2 - 20,
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  border: Border.all(
                    color: Theme.of(context).backgroundColor,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      '8',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w600),
                    ),
                    Divider(),
                    Text(
                      'Employees',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w200),
                    )
                  ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: dWidth / 2 - 20,
                  height: dWidth / 2 - 20,
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      border: Border.all(
                        color: Theme.of(context).backgroundColor,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '8',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Employees',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w200),
                        )
                      ]),
                ),
                Container(
                  width: dWidth / 2 - 20,
                  height: dWidth / 2 - 20,
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      border: Border.all(
                        color: Theme.of(context).backgroundColor,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '11',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Events',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w200),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
