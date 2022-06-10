import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note/user.dart';

String id = '';
DateTime createdTime = DateTime.now();

class FirebaseApi {
  static Future<String> createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('notes').doc();
    user.id = docUser.id;
    await docUser.set(user.toJson());

    return docUser.id;
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> readUsers() =>
      FirebaseFirestore.instance.collection('notes').snapshots();
}
