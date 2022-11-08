import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:reorderable_grid/reorderable_grid.dart';
import 'package:sossi_app/constants.dart';

import '../components/icon_value_pair.dart';

class OrgProfile extends StatefulWidget {
  const OrgProfile({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OrgProfileState createState() => _OrgProfileState();
}

class _OrgProfileState extends State<OrgProfile> {
  /// create a new list of data
  final items = List<dynamic>.generate(
      10, (index) => {"name": index, "value": "Stat: #$index"});

  /// when the reorder completes remove the list entry from its old position
  /// and insert it at its new index
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final item = items.removeAt(oldIndex);
      items.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    var dWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              // A fixed-height child.
              height: 180.0,
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
                    height: 50,
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                        child: Icon(
                          Icons.business,
                          color: Colors.white,
                          size: 75,
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
                                "Organization Name",
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
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
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 180,
                              child: AutoSizeText(
                                "123 Streeting Ave,\nNew York, NY, 11202",
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReorderableGridView.extent(
                maxCrossAxisExtent: 300,
                onReorder: _onReorder,
                childAspectRatio: 1,
                children: items.map((item) {
                  /// map every list entry to a widget and assure every child has a
                  /// unique key
                  return Card(
                    key: ValueKey(item),
                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: Text(
                        item["value"],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: Container(
            //     width: dWidth - 20,
            //     height: dWidth / 2,
            //     decoration: BoxDecoration(
            //         color: Theme.of(context).backgroundColor,
            //         border: Border.all(
            //           color: Theme.of(context).backgroundColor,
            //         ),
            //         borderRadius: const BorderRadius.all(Radius.circular(20))),
            //     child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           const Padding(
            //             padding: EdgeInsets.fromLTRB(30, 10, 0, 10),
            //             child: AutoSizeText(
            //               "123 Streeting Ave,\nNew York, NY, 11202",
            //               maxLines: 2,
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 18,
            //               ),
            //             ),
            //           ),
            //           Center(
            //             child: SizedBox(
            //                 width: dWidth - 80,
            //                 child: const Divider(
            //                   color: Colors.white,
            //                 )),
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceAround,
            //             children: const [
            //               IconValuePair(
            //                 paddingSize: 10,
            //                 brightness: true,
            //                 value: '13',
            //                 category: CategoryConstants.group,
            //               ),
            //               IconValuePair(
            //                 paddingSize: 10,
            //                 brightness: true,
            //                 value: '5',
            //                 category: CategoryConstants.event,
            //               )
            //             ],
            //           ),
            //         ]),
            //   ),
            // ),
          ],
        ));
  }
}
