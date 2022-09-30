import 'package:flutter/material.dart';
import 'package:sossi_app/screens/dashboardScreen.dart';
import 'package:sossi_app/screens/homeScreen.dart';
import 'package:sossi_app/screens/loginOrganizerScreen.dart';
import 'package:sossi_app/screens/loginScreen.dart';
import 'package:sossi_app/screens/oldLoginScreen.dart';
import 'package:sossi_app/screens/registerationScreen.dart';

void main() {
  runApp(const MyApp());
}

const appTitle = "Let's Play ATL";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      initialRoute: '/',
      routes: {
        '/register': (context) => const RegistrationScreen(),
        '/login': (context) => const OldLoginScreen(),
        '/events': (context) => const RegistrationScreen(),
        '/eventDetails': (context) => const RegistrationScreen(),
        '/main': (context) => const HomeScreen(),
        '/createEvent': (context) => const RegistrationScreen(),
        '/editEvent': (context) => const RegistrationScreen(),
        '/loginOrganizer': (context) => const LoginOrganizerScreen(),
      },
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: Colors.green,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.amber)),
      home: const MyHomePage(title: appTitle),
    );
  }
}

class LoginSignup extends StatelessWidget {
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 30.0, 0.0, 0.0),
                decoration: new BoxDecoration(color: Colors.lightGreen[100]),
                child: const Text(
                  "WELCOME TO LET'S PLAY ATL",
                  style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(50.0, 50.0, 0.0, 0.0),
              )
            ],
          ),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
                  child: ListView(
                    children: <Widget>[
                      const SizedBox(height: 60.0),
                      SizedBox(
                          height: 60.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('/login');
                              },
                              child: const Center(
                                child: Text(
                                  'LOG IN AS A CITIZEN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                      const SizedBox(height: 60.0),
                      SizedBox(
                          height: 60.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('/loginOrganizer');
                              },
                              child: const Center(
                                child: Text(
                                  'LOG IN AS AN ORGANIZER',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                      const SizedBox(height: 60.0),
                      SizedBox(
                        height: 60.0,
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
                              Navigator.of(context).pushNamed('/register');
                            },
                            child: const Center(
                              child: Text('SIGN UP',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))),
        ]));
  }
}

class SOSSIInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              const Text(
                  "Saving Our Sons & Sisters international (SOSSI) is a 501(c)3 nonprofit organization that transforms and improves the overall success of the youth, veterans, seniors, families, and communities. Our intergenerational approach creates an ecosystem focused on exposure, developing strategic partnerships between community, educators, industry professionals, nonprofits, and professionals committing services, time and resources to develop a STEM-ready workforce and access to opportunities."),
              Image.asset("assets/sossialpha.png")
            ])));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(0);
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex;
  _MyHomePageState(this._selectedIndex);

  Widget getWidgetState() {
    if (_selectedIndex == 0) {
      return LoginSignup();
    } else if (_selectedIndex == 1) {
      return SOSSIInfo();
    } else {
      return Text("ERROR! Some index value isn't supported! $_selectedIndex");
    }
  }

  Function changeIndexCB(int index) {
    return () {
      changeIndex(index);
    };
  }

  void changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[getWidgetState()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Login/Signup",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.map), label: "Info About SOSSI"),
        ],
        onTap: changeIndex,
      ),
    );
  }
}
