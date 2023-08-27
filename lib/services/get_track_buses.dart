import 'package:flutter/material.dart';
import 'package:hike_latest/services/track_buses.dart';


List<trans> cur_t = [];

void get_trans()
{
  cur_t.add(trans(BusId:"1234", start: "Calicut",end: "Kattangal",start_time: "12:00",end_time: "13:45", TransId:"#12345E",Status:"Sender Placed Parcel",Booking_date: "12-02-23",Booking_time: "11:00",time_diff:"1 hr 45 mins",price:"240",parcel_name: "Mobile Charger"));
  cur_t.add(trans(BusId:"1234", start: "Calicut",end: "Kattangal",start_time: "12:00",end_time: "13:45", TransId:"#12345E",Status:"Sender Placed Parcel",Booking_date: "12-02-23",Booking_time: "11:00",time_diff:"1 hr 45 mins",price:"240",parcel_name: "Mobile Charger"));
  cur_t.add(trans(BusId:"1234", start: "Calicut",end: "Kattangal",start_time: "12:00",end_time: "13:45", TransId:"#12345E",Status:"Sender Placed Parcel",Booking_date: "12-02-23",Booking_time: "11:00",time_diff:"1 hr 45 mins",price:"240",parcel_name: "Mobile Charger"));
  cur_t.add(trans(BusId:"1234", start: "Calicut",end: "Kattangal",start_time: "12:00",end_time: "13:45", TransId:"#12345E",Status:"Sender Placed Parcel",Booking_date: "12-02-23",Booking_time: "11:00",time_diff:"1 hr 45 mins",price:"240",parcel_name: "Mobile Charger"));
  return;
}
// fectch data from firebase using transId