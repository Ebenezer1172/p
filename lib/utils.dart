// // import 'dart:async';
// // import 'dart:convert'; 
// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart'; 
//  import 'package:flutter/material.dart';

// class Utils {
//   static void showSnackBar(BuildContext context, String text) =>
//       Scaffold.of(context)
//         ..removeCurrentSnackBar()
//         ..showSnackBar(SnackBar(content: Text(text)));

//   static DateTime? toDateTime(Timestamp value) {
//     // ignore: unnecessary_null_comparison
//     if (value == null) return null;

//     return value.toDate();
//   }

//   static dynamic fromDateTimeToJson(DateTime date) {
//     // ignore: unnecessary_null_comparison
//     if (date == null) return null;

//     return date.toUtc();
//   }

//   static StreamTransformer transformer<T>(
//           T Function(Map<String, dynamic> json) fromJson) =>
//       StreamTransformer<QuerySnapshot, List<T>>.fromHandlers(
//         handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
//           final snaps = data.docs.map((doc) => doc.data());
//           final objects = snaps.map((json) => fromJson()).toList();

//           sink.add(objects);
//         },
//       );
// }

