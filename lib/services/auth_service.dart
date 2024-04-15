import 'package:budget_buddy/screens/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  createUserWithEmailAndPassword(data, context1) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data["email"],
        password: data["password"],
      );

      Navigator.push(
        context1,
        MaterialPageRoute(builder: (context1) => const DashBoard()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ScaffoldMessenger.of(context1).showSnackBar(const SnackBar(
          content: Text('The password provided is too weak.'),
          backgroundColor: Colors.black,
        ));
      } else if (e.code == 'email-already-in-use') {
        return ScaffoldMessenger.of(context1).showSnackBar(const SnackBar(
          content: Text('The account already exists for that email.'),
          backgroundColor: Colors.black,
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  signInWithEmailAndPassword(data, context1) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: data['email'], password: data['password']);
      ScaffoldMessenger.of(context1).showSnackBar(
          const SnackBar(content: Text("Logged in Successfully")));
      Navigator.push(
        context1,
        MaterialPageRoute(builder: (context1) => const DashBoard()),
      );
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context1).showSnackBar(
        const SnackBar(
          content: Text("Invalid email or password"),
          backgroundColor: Colors.black,
        ),
      );
    }
  }
}
