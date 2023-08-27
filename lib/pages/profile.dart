import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hike_latest/pages/edit_profile.dart';
import 'package:hike_latest/services/get_places.dart';
import 'package:hike_latest/services/user.dart';

import '../services/get_profile.dart';

class profile_page extends StatefulWidget {
  profile_page({
    Key? key,
  }) : super(key: key);
  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "PROFILE",
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
        toolbarHeight: height*0.1,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: height*0.88*0.01),
// profile edit
          Container(
            margin: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.88*0.02),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.brown),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                        builder: (context) => edit_page(
                            )));
                setState(() {
                  //load data from server
                });
              },
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(width*0.03,height*0.88*0.02, width*0.1, height*0.88*0.01),
                        child: Text(
                          profile['Firstname'].toString().length > 13 ? profile['Firstname'].toString().substring(0, 13)+'...' : profile['Firstname'].toString(),
                          style: TextStyle(
                            fontSize: width*0.06,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, height*0.88*0.015),
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: Color.fromARGB(255, 83, 83, 83),
                            fontWeight: FontWeight.w400,
                            fontSize: width*0.035,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.88*0.0005),
                    child: Text(profile['Phone'].toString(),
                      style: TextStyle(
                        fontSize: width*0.035,
                      ),),
                  ),
                  SizedBox(height: height*0.88*0.02),
                ],
              ),
            ),
          ),
          SizedBox(height: height*0.88*0.01),
// KYC Verification
          InkWell(
            onTap: () {},
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(width*0.1, height*0.04, width*0.2, height*0.88*0.01),
                      child: Text(
                        'KYC verification',
                        style: TextStyle(
                          fontSize: width*0.05,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.fromLTRB(0, 0, 0, height*0.88*0.01),
                    //   //padding: EdgeInsets.fromLTRB(0, 0, width*0.1, height*0.88*0.01),
                    //   child: Text(
                    //     '>',
                    //     style: TextStyle(
                    //       color: Color.fromARGB(255, 83, 83, 83),
                    //       fontSize: width*0.05,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: width*0.1, vertical: 0),
                  child: Text('Verify your Aadhar',
                  style: TextStyle(
                    fontSize: width*0.03,
                  ),),
                ),
                SizedBox(height: height*0.88*0.02),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
// policies
          InkWell(
            onTap: () {},
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(width*0.1, height*0.03, width*0.2, height*0.88*0.01),
                      child: Text(
                        'Policies',
                        style: TextStyle(
                          fontSize: width*0.05,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.fromLTRB(0, 0, 0, height*0.88*0.01),
                    //   //padding: EdgeInsets.fromLTRB(0, 0, width*0.1, height*0.88*0.01),
                    //   child: Text(
                    //     '>',
                    //     style: TextStyle(
                    //       color: Color.fromARGB(255, 83, 83, 83),
                    //       fontSize: width*0.05,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: width*0.1, vertical: 0),
                  child: Text('Terms and Conditions, Privacy Policy',
                    style: TextStyle(
                      fontSize: width*0.03,
                    ),),
                ),
                SizedBox(height: height*0.88*0.02),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
// previous orders
          InkWell(
            onTap: () {},
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(width*0.1, height*0.03, width*0.2, height*0.88*0.01),
                      child: Text(
                        'Previous Orders',
                        style: TextStyle(
                          fontSize: width*0.05,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.fromLTRB(0, 0, 0, height*0.88*0.01),
                    //   //padding: EdgeInsets.fromLTRB(0, 0, width*0.1, height*0.88*0.01),
                    //   child: Text(
                    //     '>',
                    //     style: TextStyle(
                    //       color: Color.fromARGB(255, 83, 83, 83),
                    //       fontSize: width*0.05,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: width*0.1, vertical: 0),
                  child: Text('Check Previous Orders',
                    style: TextStyle(
                      fontSize: width*0.03,
                    ),),
                ),
                SizedBox(height: height*0.88*0.02),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
// logout
//           InkWell(
//             onTap: () {
//               showDialog(
//                 context: context,
//                 barrierDismissible: false,
//                 builder: (BuildContext context) => AlertDialog(
//                   title: const Text('Logout !'),
//                   content: const Text('Do you want to Logout ?'),
//                   actions: <Widget>[
//                     TextButton(
//                       onPressed: () {
//                         Places.clear();
//                         FirebaseAuth.instance.signOut();
//                         Navigator.pop(context);
//                       },
//                       child: const Text('LOGOUT'),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text('NO'),
//                     ),
//                   ],
//                 ),
//               );
//             },
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.fromLTRB(50, 40, 190, 10),
//                   child: Text(
//                     'Logout',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                       letterSpacing: 2.0,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                   child: Text(
//                     '>',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 83, 83, 83),
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Logout !'),
                  content: const Text('Do you want to Logout ?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Places.clear();
                        FirebaseAuth.instance.signOut();
                        Navigator.pop(context);
                      },
                      child: const Text('LOGOUT'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('NO'),
                    ),
                  ],
                ),
              );
            },
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(width*0.1, height*0.03, width*0.2, height*0.88*0.01),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: width*0.05,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.fromLTRB(0, 0, 0, height*0.88*0.01),
                    //   //padding: EdgeInsets.fromLTRB(0, 0, width*0.1, height*0.88*0.01),
                    //   child: Text(
                    //     '>',
                    //     style: TextStyle(
                    //       color: Color.fromARGB(255, 83, 83, 83),
                    //       fontSize: width*0.05,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                // Container(
                //   alignment: Alignment.centerLeft,
                //   margin: EdgeInsets.symmetric(horizontal: width*0.1, vertical: 0),
                //   child: Text('Check Previous Orders',
                //     style: TextStyle(
                //       fontSize: width*0.03,
                //     ),),
                // ),
                SizedBox(height: height*0.88*0.02),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
