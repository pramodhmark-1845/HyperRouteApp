import 'package:flutter/material.dart';
import 'package:hike_latest/pages/googlemaps_track.dart';

class trans {
  String? BusId;
  String? start;
  String? end;
  String? start_time;
  String? end_time;
  String ? TransId;
  String ? Status;
  String ? Booking_date;
  String ? Booking_time;
  String ?  time_diff;
  String ? price;
  String ? parcel_name;
  trans({this.BusId, this.start, this.end, this.start_time, this.end_time,this.TransId,this.Status,this.Booking_date,this.Booking_time,this.price,this.time_diff,this.parcel_name});
}

class trans_card extends StatefulWidget {
  trans s;
  trans_card({Key? key, required this.s}) : super(key: key);

  @override
  State<trans_card> createState() => _trans_cardState();
}

class _trans_cardState extends State<trans_card> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print("Height");
    print(height);
    print("Width");
    print(width);
    return Center(
      child: SizedBox(
        width: width * 1,
        child: Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: width*0.02, vertical: height*0.01),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(width*0.04,height*0.88*0.01,width*0.04,height*0.88*0.005),
                child: Text(
                  widget.s.parcel_name.toString()+" - " + widget.s.TransId.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: width*0.045,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(width*0.04,0,width*0.04,height*0.88*0.01),
                    child: Text("Rs "+widget.s.price.toString(),
                    style: TextStyle(
                      fontSize: width*0.03,
                      letterSpacing: 1,
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(width*0.045,0,width*0.04,height*0.88*0.01),
                    child: Text("Date -"+widget.s.Booking_date.toString(),
                      style: TextStyle(
                        fontSize: width*0.03,
                        letterSpacing: 1,
                      ),),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(width*0.045,0,width*0.04,height*0.88*0.01),
                    child: Text("Booking Time -"+widget.s.Booking_time.toString(),
                      style: TextStyle(
                        fontSize: width*0.03,
                        letterSpacing: 1,
                      ),),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(width*0.045,height*0.88*0.008,width*0.04,height*0.88*0.008),
                padding:EdgeInsets.fromLTRB(0,height*0.88*0.008,0,height*0.88*0.008),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xF73A2DCD)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  children: [
                    SizedBox(width: width*0.04),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.s.start.toString(),
                          style: TextStyle(
                            fontSize: width*0.04,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          widget.s.start_time.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: width*0.05,
                          ),
                        ),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: width*0.05),
                        child: Text("- -"+widget.s.time_diff.toString()+"- -")),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.s.end.toString(),
                          style: TextStyle(
                            fontSize: width*0.04,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          widget.s.end_time.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: width*0.05,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(width*0.045,height*0.88*0.01,width*0.04,height*0.88*0.01),
                child: Text("STATUS - "+widget.s.Status.toString(),
                  style: TextStyle(
                    fontSize: width*0.04,
                    letterSpacing: 1,
                  ),),
              ),
              Center(
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                      },
                      child: Center(
                        child: Container(
                          // height: height*0.88*0.1,
                          // width: width*0.95,
                          padding: EdgeInsets.symmetric(horizontal: width*0.01, vertical: height*0.88*0.01),
                          margin: EdgeInsets.symmetric(horizontal: width*0.04, vertical: height*0.88*0.01),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xFCC40000)),
                          ),
                          child: Text(
                            'ORDER DETAILS',
                            style: TextStyle(
                              color: Color(0xFCC40000),
                              fontSize: width*0.03,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => googlemapstrack()));
                      },
                      child: Center(
                        child: Container(
                          // height: height*0.88*0.1,
                          // width: width*0.95,
                          padding: EdgeInsets.symmetric(horizontal: width*0.01, vertical: height*0.88*0.01),
                          margin: EdgeInsets.symmetric(horizontal: width*0.005, vertical: height*0.88*0.01),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xF7006E25)),
                          ),
                          child: Text(
                            'LIVE TRACKING',
                            style: TextStyle(
                              color: Color(0xF7006E25),
                              fontSize: width*0.03,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height*0.88*0.025,)
            ],
          ),
        ),
      ),
    );
  }
}