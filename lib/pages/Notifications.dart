import 'package:flutter/material.dart';

class notf_page extends StatefulWidget {
  @override
  State<notf_page> createState() => _notf_pageState();
}

class _notf_pageState extends State<notf_page> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print("Height");
    print(height);
    print("Width");
    print(width);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NOTIFICATIONS',
          style: TextStyle(
              letterSpacing: 2.0,
              fontSize: width*0.045,
              shadows: <Shadow>[
                Shadow(
                  blurRadius: 2.0,
                  offset: const Offset(0.0, 1.5),
                )
              ],
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xF73A2DCD),
        toolbarHeight: height*0.12,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
