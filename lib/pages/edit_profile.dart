import 'package:firebase_auth/firebase_auth.dart';
import 'package:hike_latest/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:hike_latest/services/get_profile.dart';

import '../main.dart';
import '../services/user.dart';

class edit_page extends StatelessWidget {

  TextEditingController fn = TextEditingController();
  TextEditingController ln = TextEditingController();
  TextEditingController ml = TextEditingController();
  static const String _title = 'Edit Profile';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          toolbarHeight: height*0.1,
          backgroundColor: Color(0xF73A2DCD),
        ),
        body: Padding(
            padding: EdgeInsets.all(width*0.02),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(width*0.02),
                    child: Text(
                      '',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: width*0.05),
                    )),
// previous first name
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
                  child: Text('Previous First Name : ${profile['Firstname'].toString()}'),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    textCapitalization: TextCapitalization.words,
                    controller: fn,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                    ),
                  ),
                ),
// previous last name
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: EdgeInsets.fromLTRB(10, 10, 5, 0),
                  child: Text('Previous Last Name : ${profile['Lastname'].toString()}'),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    textCapitalization: TextCapitalization.words,
                    controller: ln,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                  ),
                ),
// Last Email details
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: EdgeInsets.fromLTRB(10, 10, 5, 0),
                  child: Text('Previous Email : ${profile['Email'].toString()}'),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: ml,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                ),
                TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.blue.withOpacity(0.04);
                          }
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return Color.fromARGB(255, 0, 144, 31)
                                .withOpacity(0.12);
                          }
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    onPressed: () async {
                      if (ln.text.isEmpty == true ||
                          fn.text.isEmpty == true ||
                          ml.text.isEmpty == true) {
                        showDialog(
                          context: context,
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
                        //Loader
                        showDialog(context: context,
                            barrierDismissible: false,
                            builder:(context){
                              return Center(child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Color(0xF73A2DCD)),
                              ) );
                            });
                        await DatabaseService(uid:auth.uid
                        ).updateProfile(fn.text, ln.text, ml.text, profile['Phone'].toString());
                        get_profile().getprofile();
                        Navigator.of(context).pop();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => main_page(index: 1)),
                                (route) => false);
                      }
                    },
                    child: const Text('SAVE'))
              ],
            )));
  }
}
