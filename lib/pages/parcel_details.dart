import 'package:hike_latest/pages/bus_timings.dart';
import 'package:flutter/material.dart';
import 'package:hike_latest/pages/buses_page.dart';
import 'package:hike_latest/services/Transaction_process.dart';
import 'package:hike_latest/services/service_card.dart';

class parcel_page extends StatefulWidget {
  parcel_page(
      {Key? key})
      : super(key: key);
  @override
  State<parcel_page> createState() => _parcel_pageState();
}

class _parcel_pageState extends State<parcel_page> {
  TextEditingController item = TextEditingController(text: '');
  TextEditingController cat = TextEditingController(text: '');
  TextEditingController est_weight = TextEditingController(text: '');
  TextEditingController est_val = TextEditingController(text: '');
  TextEditingController product_description = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PARCEL DETAILS',
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(width*0.06, height*0.02, width*0.06,0),
                child: Text(
                  'Please enter (*) details mandatorily',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                )),
//item name
            Container(
              padding: EdgeInsets.fromLTRB(width*0.06, height*0.02, width*0.06, height*0.01),
              child: TextField(
                controller: item,
                decoration: const InputDecoration(
                  labelText: 'Product (or) Item Name* ',
                ),
              ),
            ),
// parcel description
            Container(
              padding: EdgeInsets.fromLTRB(width*0.06, height*0.02, width*0.06, height*0.01),
              child: TextField(
                controller: product_description,
                decoration: const InputDecoration(
                  labelText: 'Parcel Description',
                ),
              ),
            ),
//parcel categary
            Container(
              padding: EdgeInsets.fromLTRB(width*0.06, height*0.02, width*0.06, height*0.01),
              child: TextField(
                controller: cat,
                decoration: const InputDecoration(
                  labelText: 'Parcel Category*',
                ),
              ),
            ),
//Estimated weight
            Container(
              padding: EdgeInsets.fromLTRB(width*0.06, height*0.02, width*0.06, height*0.01),
              child: TextField(
                controller: est_weight,
                decoration: const InputDecoration(
                  labelText: 'Estimated Weight*',
                ),
              ),
            ),
//Estimated Value
            Container(
              padding: EdgeInsets.fromLTRB(width*0.06, height*0.02, width*0.06, height*0.02),
              child: TextField(
                controller: est_val,
                decoration: const InputDecoration(
                  labelText: 'Estimated value*',
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                if (cat.text == '' ||
                    item.text == '' ||
                    est_weight.text == '' ||
                    est_val.text == '') {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text('Invalid Entry'),
                            content: const Text('Please Enter Details'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ));
                } else {
                  showDialog(context: context,
                      barrierDismissible: false,
                      builder:(context){
                        return Center(child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Color(0xF73A2DCD)),
                        ) );
                      });
                  await get_bus_data(TransDetails.start!, TransDetails.end!);
                  Parceldetails.cat=cat.text.toString();
                  Parceldetails.estval=est_val.text.toString();
                  Parceldetails.estwt=est_weight.text.toString();
                  Parceldetails.parceldes=product_description.text.toString();
                  Parceldetails.productname=item.text.toString();
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              bus_times(start: TransDetails.start,end: TransDetails.end)));
                }
              },
              child:  Container(
                // height: height*0.88*0.1,
                // width: width*0.95,
                padding: EdgeInsets.symmetric(vertical: height*0.88*0.025),
                margin: EdgeInsets.symmetric(horizontal: width*0.1, vertical: height*0.88*0.01),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xF73A2DCD),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(
                        0.0,
                        10.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    )
                  ],
                ),
                child: Text(
                  'PROCEED',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontSize: width*0.05,
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
          ],
        ),
      ),
    );
  }
}
