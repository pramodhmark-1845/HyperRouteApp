import 'package:hike_latest/services/conversion_func.dart';
import 'package:hike_latest/services/service_card.dart';
import 'package:flutter/material.dart';

class order_summary extends StatefulWidget {
  service s;
  order_summary({Key? key, required this.s}) : super(key: key);

  @override
  State<order_summary> createState() => _order_summaryState();
}

class _order_summaryState extends State<order_summary> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ORDER SUMMARY',
          style: TextStyle(
              letterSpacing: 2.0,
              fontSize: width*0.04,
              shadows: <Shadow>[
                Shadow(
                  blurRadius: 2.0,
                  offset: const Offset(0.0, 1.5),
                )
              ],
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xF73A2DCD),
        toolbarHeight: height*0.1,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              '#OrderID-1234567',
              style: TextStyle(
                fontSize: width*0.05,
                color: Colors.grey[700],
              ),
            ),
          ),
          Container(
            height: height*0.9*0.44,
            width: width,
            child: Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.9*0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 SizedBox(height: height*0.9*0.4*0.02),
                  Container(
                    height: height*0.9*0.4*0.13,
                    padding: EdgeInsets.symmetric(horizontal: width*0.025, vertical: height*0.9*0.4*0.02),
                    margin: EdgeInsets.symmetric(horizontal: width*0.045, vertical: height*0.9*0.4*0.025),
                    color: Color(0xF73A2DCD),
                    child: Text(
                      "Bus No - " + widget.s.BusId.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: width*0.06,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: height*0.9*0.4*0.14,
                    child: Row(
                      children: [
                        SizedBox(width: width*0.045),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.s.start.toString(),
                              style: TextStyle(
                                fontSize: width*0.035,
                              ),
                            ),
                            Text(
                              widget.s.start_time.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: width*0.05,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: width*0.04),
                            child: Text(
                                "---"+time_differece_func(widget.s.time_diff!)+"---\n(Estimated Delivery Time)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: width*0.03
                            ),)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.s.end.toString(),
                              style: TextStyle(
                                fontSize: width*0.035,
                              ),
                            ),
                            Text(
                              widget.s.end_time.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: width*0.05,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height*0.9*0.4*0.05),
                  Container(
                    height: height*0.9*0.4*0.05,
                    margin: EdgeInsets.symmetric(horizontal: width*0.045, vertical: height*0.9*0.4*0.01),
                    child: Text(
                      'BILL DETAILS',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: width*0.03,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  Container(
                    height: height*0.9*0.4*0.08,
                    color: Colors.green[300],
                    padding: EdgeInsets.symmetric(horizontal: width*0.02, vertical: height*0.9*0.4*0.01),
                    margin: EdgeInsets.symmetric(horizontal: width*0.045, vertical: height*0.9*0.4*0.005),
                    child: Text('Box Selected - Size No 30 (25cm*25cm*25cm)',
                    style: TextStyle(
                      fontSize: width*0.035,
                    ),),
                  ),
                  SizedBox(height: height*0.9*0.4*0.01),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width*0.045, vertical: height*0.9*0.4*0.005),
                    child: Text('Chrage per 1km (for 1kg parcel) - 1 Rs',
                    style: TextStyle(
                      fontSize: width*0.03
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width*0.045, vertical: height*0.9*0.4*0.005),
                    child: Text('Parcel Details - Mobile Phone',
                      style: TextStyle(
                          fontSize: width*0.03
                      ),),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width*0.045, vertical: height*0.9*0.4*0.005),
                    child: Text('Parcel Estimated Average Weight - 5 Kg',
                    style: TextStyle(
                      fontSize: width*0.03
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width*0.045, vertical: height*0.9*0.4*0.005),
                    child: Text('Estimated Value - 15000 Rs',
                      style: TextStyle(
                          fontSize: width*0.03
                      ),),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width*0.045, vertical: height*0.9*0.4*0.005),
                    child: Text('Distance - 10 kms',
                    style: TextStyle(
                      fontSize: width*0.03
                    ),),
                  ),
                  SizedBox(height: height*0.9*0.4*0.02),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width*0.04),
                    padding: EdgeInsets.symmetric(vertical: height*0.9*0.4*0.01),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xF73A2DCD)),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: width*0.045, vertical: height*0.9*0.4*0.001),
                          child: Text(
                            'Total Amount',
                            style: TextStyle(
                              fontSize: width*0.06,
                            ),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.9*0.4*0.001),
                          child: Text('(1*5*10)    ='),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, width*0.02, 0),
                          child: Text(
                            '50 Rs',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: width*0.06,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: height*0.005),
          Container(
            height: height*0.05,
            // decoration: BoxDecoration(
            //   border: Border.all(color: Color(0xF73A2DCD)),
            //   borderRadius: BorderRadius.all(Radius.circular(5)),
            // ),
            margin: EdgeInsets.symmetric(horizontal: width*0.025),
            child: Text(
              'BEFORE CONFIRMATION OF ORDER\nPlease Track/check the current Location of Bus and Confirm that it is not crossed the Start Point',
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize:width*0.028,
              ),
            ),
          ),
          Container(
            height: height*0.2,
            width: width,
            // decoration: BoxDecoration(
            //   border: Border.all(color: Color(0xF73A2DCD)),
            //   borderRadius: BorderRadius.all(Radius.circular(5)),
            // ),
            padding: EdgeInsets.symmetric(vertical: 50),
            alignment: Alignment.center,
            child: Text(
              '.....Track Bus.....',
              style: TextStyle(
                fontSize: 25,
                letterSpacing: 3.0,
              ),
            ),
          ),
          SizedBox(height: height*0.005),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(horizontal: width*0.03),
            child: Text(
              'Disclaimer*',
              style: TextStyle(
                color: Colors.red,
                fontSize: width*0.03,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width*0.03),
            child: Text(
              'Parcel details should be Genuine, Any mis-deatils and Parcels containing illegal products (Oils, Petrochemicals etc) leads to severe action at Random Checks\nRead Terms and Conditions, Policies for more details',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: width*0.025,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        color: const Color(0xF73A2DCD),
        child: InkWell(
          onTap: () {
           // Navigator.push(
                //context, MaterialPageRoute(builder: (context) => Payment()));
          },
          child: SizedBox(
            height: height*0.06,
            width: double.infinity,
            child: Center(
              child: Text(
                'CONTINUE TO PAY',
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: width*0.045,
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
}
