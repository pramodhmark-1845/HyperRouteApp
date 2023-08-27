import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


List <String> Places = [];

Future getplaces() async {
  await FirebaseFirestore.instance.collection('Places').get().then(
          (snapshot) =>
          snapshot.docs.forEach((document) {
            Places.add(document.reference.id);
          })
  );
}
