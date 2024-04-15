import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DataBase {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(data, context) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    await users
        .doc(userId)
        .set(data)
        .then((value) => print("User Added"))
        .catchError((error) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Unable to add transaction"),
                backgroundColor: Colors.black,
              ),
            ));
  }
}
