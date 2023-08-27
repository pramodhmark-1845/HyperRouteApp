// Transaction details
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class TransactionDetails{
  Timestamp ? bookingtime;
  String ? busid;
  String ? customerid;
  String ? end;
  int ? lockerbox;
  Timestamp ? ppt;
  String ? parcelid;
  String ? paymentid;
  Timestamp ? rt;
  int ? slot;
  String ? start;
  String ? transactionid;
  String ? receiverphone;
  TransactionDetails({this.end,this.start,this.bookingtime,this.busid,this.customerid,this.lockerbox,this.parcelid,this.paymentid,this.ppt,this.rt,this.slot,this.transactionid,this.receiverphone});
}
TransactionDetails TransDetails = TransactionDetails();

// Parcel details

class ParcelDetails{
  String ? cat;
  String ? estval;
  String ? estwt;
  String ? parceldes;
  String ? parcelid;
  String ? productname;
  String ? transactionid;
}

ParcelDetails Parceldetails = ParcelDetails();

// generate parcel id function
String TransId='';
String ParcelId='';
Future generate_transId() async
{
  var data = await FirebaseFirestore.instance.collection('TransactionTable').doc('CurrentSerial').get();
  int serial = data['Serial'];
  TransId= 'HR'+DateTime.now().month.toString()+DateTime.now().day.toString()+(serial+1).toString();
  await  FirebaseFirestore.instance.collection('TransactionTable').doc('CurrentSerial').set({
    'Serial':serial+1,
  });
  return TransId;
}
String generate_parcelid()
{
  ParcelId=TransId.substring(0,0)+'PR'+TransId.substring(2);
  return ParcelId;
}
// send transaction details to firebase
Future createTransaction() async{
    var date = DateTime.now();
    return await FirebaseFirestore.instance.collection('TransactionTable').doc(date.toString()).set({
      'BookingTime': date,
      'BusId': TransDetails.busid,
      'CustomerId': FirebaseAuth.instance.currentUser!.uid,
      'EndLocation':TransDetails.end,
      'LockerBox': TransDetails.lockerbox,
      'PPT' : '',
      'TransactionId': await generate_transId(),
      'ParcelId': await generate_parcelid(),
      'RT' : '',
      'SlotNumber': TransDetails.slot ,
      'ReceiverPhone': TransDetails.receiverphone,
      'StartLocation': TransDetails.start,
      'PaymentId': ''
    });
}

Future createParcel() async{
  var date = DateTime.now();
  return await FirebaseFirestore.instance.collection('ParcelDetailsTable').doc(date.toString()).set({
    'Category': Parceldetails.cat,
    'EstVal': Parceldetails.estval,
    'EstWt': Parceldetails.estwt,
    'ParcelDescription': Parceldetails.parceldes,
    'Parcel_Id': ParcelId,
    'ProductName': Parceldetails.productname,
    'TransactionId': TransId,
  });
}
