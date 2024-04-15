import 'package:budget_buddy/screens/login.dart';
import 'package:budget_buddy/widgets/add_transactions_form.dart';
import 'package:budget_buddy/widgets/hero_card.dart';
import 'package:budget_buddy/widgets/transactions_cards.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

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

  final userId = FirebaseAuth.instance.currentUser!.uid;

  _dialogueBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: AddTransaction(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen[400],
        onPressed: () {
          _dialogueBuilder(context);
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.lightGreen[50],
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        actions: [
          IconButton(
              onPressed: () {
                logOut(context);
              },
              icon: isLoading
                  ? const CircularProgressIndicator()
                  : const Icon(Icons.exit_to_app))
        ],
        title: const Text("Yelooo!"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroCard(
              userId: userId,
            ),
            const SizedBox(height: 20),
            TransactionsCard(),
          ],
        ),
      ),
    );
  }
}
