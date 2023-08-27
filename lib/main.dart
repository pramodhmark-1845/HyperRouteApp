import 'package:firebase_core/firebase_core.dart';
import 'package:hike_latest/animations/startapp.dart';
import 'package:hike_latest/pages/enter_profile.dart';
import 'package:hike_latest/pages/profile_loader.dart';
import 'package:flutter/material.dart';
import 'package:hike_latest/services/testfile.dart';
import 'pages/home.dart';
import 'pages/profile.dart';
import 'pages/track_orders.dart';
import 'pages/track_orders.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: start_app(),
      //home: test(),
    );
  }
}

class main_page extends StatefulWidget {
  int index;
  main_page({Key? key, required this.index}) : super(key: key);
  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screens = [
      home_page(),
      profile_load(),
      track_orders(),
    ];
    return Scaffold(
      body: IndexedStack(
        index: super.widget.index,
        children: screens,
      ),
// Bottom Navigation Bar
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
            currentIndex: super.widget.index,
            onTap: (index) => setState(() => super.widget.index = index),
            backgroundColor: Color(0xF73A2DCD),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            selectedFontSize: 15,
            iconSize: 30,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.track_changes),
                label: 'Track Orders',
              ),
            ]),
      ),
    );
  }
}
