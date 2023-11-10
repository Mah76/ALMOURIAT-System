// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserServices {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  Future getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
  }

  /// return true if phone number already exists
  static Future<bool> phoneNumberExists(String phoneNumber,
      {Function(Object)? onError}) async {
    var isValidUser = false;
    // Fluttertoast.showToast(
    //     msg: 'This is toast notification',
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     backgroundColor: textColor,
    //     textColor: white);
    await _firestore
        .collection('users')
        .where('Phone', isEqualTo: phoneNumber)
        .get()
        .then((result) {
      if (result.docs.isNotEmpty) {
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

  static void addUser(
    Registrant data, {
    Function()? onSuccess,
    Function(Object)? onError,
  }) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).set(
        {'name': data.name, 'Phone': data.phoneNumber},
        SetOptions(merge: true)).then((value) {
      if (onSuccess != null) onSuccess();
    }).catchError(
      onError ??
          (_) {
            log("add user : failed");
          },
    );
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
            name: result.docs[0].data()['name'],
            phoneNumber: phoneNumber,
          );
        }
      }).catchError((_) {});
    }
    return registrant;
  }
}

class Registrant {
  String name;
  String phoneNumber;

  Registrant({required this.name, required this.phoneNumber});
}
