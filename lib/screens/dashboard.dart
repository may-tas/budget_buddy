import 'package:budget_buddy/screens/home_page.dart';
import 'package:budget_buddy/screens/login.dart';
import 'package:budget_buddy/screens/transaction_page.dart';
import 'package:budget_buddy/widgets/navbar.dart';
import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final user = FirebaseAuth.instance.currentUser;
  bool isLoading = false;
  int currentIndex = 0;
  var pageViewList = [const HomePage(), const TransactionPage()];

  logOut(context) async {
    setState(() {
      isLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    setState(() {
      isLoading = false;
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Logged out Successfully")));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (((context) => const LoginPage()))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: pageViewList[currentIndex],
    );
  }
}
