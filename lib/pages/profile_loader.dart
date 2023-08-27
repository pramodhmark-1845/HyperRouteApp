import 'package:firebase_auth/firebase_auth.dart';
import 'package:hike_latest/pages/login_page.dart';
import 'package:hike_latest/pages/profile.dart';
import 'package:flutter/material.dart';

class profile_load extends StatefulWidget {

  @override
  State<profile_load> createState() => _profile_loadState();
}

class _profile_loadState extends State<profile_load> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot){
            if(snapshot.hasData){
              return profile_page();
         }
            return login_page();
       }
     )
    );
  }
}
