import 'package:hike_latest/main.dart';
import 'package:hike_latest/pages/home.dart';
import 'package:hike_latest/services/service_card.dart';
import 'package:flutter/material.dart';
import 'package:hike_latest/services/service_card.dart';

class bus_times extends StatefulWidget {
  String? start;
  String? end;
  bus_times({Key? key,required this.start,required this.end})
      : super(key: key);
  @override
  State<bus_times> createState() => _bus_timesState();
}
class _bus_timesState extends State<bus_times> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if(s_buses.isEmpty==true){
      return Scaffold (
        appBar: AppBar(
          title: Text(
            widget.start.toString()+ " -> " + widget.end.toString(),
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
          toolbarHeight: height*0.12,
        ),
        body: Center(
            child: Text("No Buses Available !\nPlease Try Again Later",
            style: TextStyle(
              letterSpacing: 2.0,
              fontWeight: FontWeight.w400,
            ),),
        ),
        bottomNavigationBar: Material(
          color: const Color(0xF73A2DCD),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (context) => main_page(index: 0)), (Route route) => false);
            },
            child: const SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: Text(
                  'HOME',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontSize: 20.0,
                    shadows: <Shadow>[
                      Shadow(
                        blurRadius: 2.0,
                        offset: const Offset(0.0, 1.5),
                      )
                    ],
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.start.toString() + " -> " + widget.end.toString(),
            style: TextStyle(
                letterSpacing: 1.0,
                fontSize: width*0.04,
                // shadows: <Shadow>[
                // //   Shadow(
                // //     blurRadius: 2.0,
                // //     offset: const Offset(0.0, 1.5),
                // //   )
                // // ],
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xF73A2DCD),
          toolbarHeight: height*0.1,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: s_buses!.map((e) => bus_card(s: e)).toList(),
          ),
        ),
      );
    }
  }
}
