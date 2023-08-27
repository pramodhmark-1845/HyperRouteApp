import 'package:flutter/material.dart';

class buses_page extends StatefulWidget {
  @override
  State<buses_page> createState() => _buses_pageState();
}

class _buses_pageState extends State<buses_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calicut -> Mukkam',
          style: TextStyle(
              letterSpacing: 2.0,
              fontSize: 20.0,
              shadows: <Shadow>[
                Shadow(
                  blurRadius: 2.0,
                  offset: const Offset(0.0, 1.5),
                )
              ],
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xF73A2DCD),
        toolbarHeight: 100,
      ),
    );
  }
}
