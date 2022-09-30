import 'package:flutter/material.dart';

//citizen login

class OldLoginScreen extends StatefulWidget {
  const OldLoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OldLoginScreenState createState() => _OldLoginScreenState();
}

class _OldLoginScreenState extends State<OldLoginScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen[50],
        resizeToAvoidBottomInset: false,
        body: ListView(children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 40.0),
                  decoration: BoxDecoration(color: Colors.lightGreen[100]),
                  child: const Text(
                    "LOG IN AS A CITIZEN",
                    style:
                        TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                )
              ],
            ),
          ),
          Container(
              padding:
                  const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        labelText: 'EMAIL ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                        labelText: 'PASSWORD ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: true,
                  ),
                  const SizedBox(height: 60.0),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/main');
                      },
                      child: SizedBox(
                          height: 60.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: const Center(
                              child: Text(
                                'LOG IN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ))),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    height: 40.0,
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 40.0,
                                spreadRadius: .5)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Center(
                          child: Text('Go Back',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ]));
  }
}
