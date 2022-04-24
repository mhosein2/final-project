import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> setupUser(String userName) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseAuth _auth = FirebaseAuth.instance;
  String uid = _auth.currentUser!.uid.toString();
  String userRole = "user";
  users.add({'username': userName, 'uid': uid, 'role': userRole});
  return;
}
