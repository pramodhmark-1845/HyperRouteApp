import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Map <String, dynamic> profile={'Firstname':'Junior'};
class get_profile{
final auth  = FirebaseAuth.instance.currentUser!;
get_profile();
//Map <String, dynamic> profile={};
Future getprofile() async {
  await FirebaseFirestore.instance
      .collection('Profiles')
      .doc(auth.uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      profile = documentSnapshot.data() as Map<String, dynamic>;
      print(profile);
    }
  });
}
}