import 'package:firebase_auth/firebase_auth.dart';
import 'package:hike_latest/main.dart';
import 'package:hike_latest/pages/login_page.dart';
import 'package:hike_latest/pages/profile_loader.dart';
import 'package:flutter/material.dart';
import 'package:hike_latest/services/user.dart';

class enter_profile_page extends StatelessWidget {
  String phone;
  enter_profile_page({
    Key? key,
    required this.phone,
  }) : super(key: key);
  TextEditingController fn = TextEditingController();
  TextEditingController ln = TextEditingController();
  TextEditingController ml = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.1),
            child: ListView(
              children: <Widget>[
                Container(
                  //padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  margin: EdgeInsets.symmetric(horizontal: width*0.02, vertical: height*0.02),
                  alignment: Alignment.center,
                  child: Text(
                    'NEW TO HIKE !',
                    style: TextStyle(
                      color: Color(0xF73A2DCD),
                      fontSize: width*0.06,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
// first name
                Container(
                  padding: EdgeInsets.all(width*0.03),
                  child: TextField(
                    controller: fn,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                    ),
                  ),
                ),
// last name
                Container(
                  padding: EdgeInsets.all(width*0.03),
                  child: TextField(
                    controller: ln,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                  ),
                ),
//Email details
                Container(
                  padding: EdgeInsets.all(width*0.03),
                  child: TextField(
                    controller: ml,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                ),
                SizedBox(height: height*0.03),
                InkWell(
                  onTap: ()  async {
                    if (ln.text.isEmpty == true ||
                        fn.text.isEmpty == true ||
                        ml.text.isEmpty == true) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Invalid Entry'),
                          content: const Text('Please fill all details'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      final auth= FirebaseAuth.instance.currentUser !;
                      //Loading
                      showDialog(context: context,
                          barrierDismissible: false,
                          builder:(context){
                            return Center(child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Color(0xF73A2DCD)),
                            ) );
                          });
                      await DatabaseService(uid:auth.uid
                      ).CreateProfile(fn.text, ln.text, ml.text,phone);
                      Navigator.of(context).pop();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => main_page(index: 1)),
                              (route) => false);
                    }
                  },
                  child: Container(
                    // height: height*0.88*0.1,
                    // width: width*0.95,
                    padding: EdgeInsets.symmetric(horizontal: width*0.1, vertical: height*0.02),
                    margin: EdgeInsets.symmetric(horizontal: width*0.08, vertical: height*0.01),
                   // alignment: Alignment.center,
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
                      'Create Profile',
                      textAlign: TextAlign.center,
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
                  )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width*0.01),
                  child: TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login with different Phone Number?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: width*0.035,
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
