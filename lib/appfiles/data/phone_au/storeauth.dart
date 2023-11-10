import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserServices {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;

  /// return true if phone number already exists

  static Future<bool> phoneNumberExists(String phoneNumber,
      {Function(Object)? onError}) async {
    var isValidUser = false;

    await _firestore
        .collection('users')
        .where('Phone', isEqualTo: phoneNumber)
        .get()
        .then((result) {
      if (result.docs.length > 0) {
        isValidUser = true;
      }
    }).catchError(
      onError ??
          (_) {
            log("checking phone number : failed");
          },
    );

    return isValidUser;
  }

  static Future<Registrant?> getUserLogin() async {
    Registrant? registrant;
    if (_auth.currentUser != null) {
      var phoneNumber = _auth.currentUser!.phoneNumber!;
      await _firestore
          .collection('users')
          .where('Phone', isEqualTo: phoneNumber)
          .get()
          .then((result) {
        if (result.docs.length > 0) {
          registrant = Registrant(
            name: result.docs[0].data()['Name'],
            phoneNumber: phoneNumber,
          );
        }
      }).catchError((_) {});
    }
    return registrant;
  }

  static void addUser(
    Registrant data, {
    Function()? onSuccess,
    Function(Object)? onError,
  }) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).set(
        {'Name': data.name, 'Phone': data.phoneNumber},
        SetOptions(merge: true)).then((value) {
      if (onSuccess != null) onSuccess();
    }).catchError(
      onError ??
          (_) {
            log("add user : failed");
          },
    );
  }
}

class Registrant {
  String name;
  String phoneNumber;

  Registrant({required this.name, required this.phoneNumber});
}
