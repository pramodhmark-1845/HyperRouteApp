import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String ? uid;
  DatabaseService({this.uid});
  final CollectionReference profiles = FirebaseFirestore.instance.collection('Profiles');
  Future CreateProfile(String firstname, String lastname, String email, String phone) async
  {
      return await profiles.doc(uid).set({
        'Firstname':firstname.toString(),
        'Lastname':lastname.toString(),
        'Email':email.toString(),
        'Phone':phone,
      });
  }
  Future updateProfile(String firstname, String lastname, String email, String phone) async
  {
    return await profiles.doc(uid).update({
      'Firstname':firstname.toString(),
      'Lastname':lastname.toString(),
      'Email':email.toString(),
      'Phone':phone,
    });
  }
}