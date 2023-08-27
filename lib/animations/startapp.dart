import 'package:flutter/material.dart';
import 'package:hike_latest/services/get_profile.dart';
import 'package:lottie/lottie.dart';

import '../main.dart';

class start_app extends StatefulWidget {
  const start_app({Key? key}) : super(key: key);

  @override
  State<start_app> createState() => _start_appState();
}

class _start_appState extends State<start_app> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>main_page(index:0))));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: LottieBuilder.asset("assets/start.json"),
        ),
      ),
    );
  }
}
