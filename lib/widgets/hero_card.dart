import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({
    super.key,
    required this.userId,
  });
  final String userId;

  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> _usersStream =
        FirebaseFirestore.instance.collection('users').doc(userId).snapshots();
    return StreamBuilder<DocumentSnapshot>(
      stream: _usersStream,
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        var data = snapshot.data!.data() as Map<String, dynamic>;

        return Cards(
          data: data,
        );
      },
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({
    super.key,
    required this.data,
  });

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[50],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Total Balance",
                  style: GoogleFonts.sourceSans3(
                      fontSize: 22, fontWeight: FontWeight.bold, height: 1.2),
                ),
                Text(
                  "${data['remainingAmount']}",
                  style: GoogleFonts.sourceSans3(
                      fontSize: 50, fontWeight: FontWeight.bold, height: 1.2),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CardOne(
                    color: Colors.lightGreen.shade400,
                    heading: "Credit",
                    amount: '${data['totalCredit']}',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CardOne(
                    color: Colors.red.shade400,
                    heading: "Debit",
                    amount: '${data['totalDebit']}',
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardOne extends StatelessWidget {
  const CardOne(
      {super.key,
      required this.color,
      required this.heading,
      required this.amount});
  final Color color;
  final String heading;

  final String amount;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                heading,
                style: GoogleFonts.sourceSans3(
                    fontSize: 24, fontWeight: FontWeight.w400, height: 1.2),
              ),
              Text(
                "₹$amount",
                style: GoogleFonts.sourceSans3(
                    fontSize: 26, fontWeight: FontWeight.bold, height: 1.2),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          SizedBox(width: 40),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(heading == "Credit"
                ? Icons.arrow_upward_outlined
                : Icons.arrow_downward_outlined),
          ),
          const SizedBox(width: 1),
        ],
      ),
    );
  }
}
