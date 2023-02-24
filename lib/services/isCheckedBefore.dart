import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_code/screens/Scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future addToFire(
    {required String code,
    }) async {
  final docUser = FirebaseFirestore.instance
      .collection('attendees').doc(code);
  final json = {
    'code':code ,
  };

  await docUser.set(json);
}


Future isScanned({required String code})async{
  List codes=[];
  await FirebaseFirestore.instance.collection('attendees').get().then((snap) =>snap.docs.forEach((element) {
    codes.add(element.reference.id);
  }) );
  if(codes.contains(code)){
    return true;
  }
  else return false;
}