import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({
    super.key,
  });

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
                  "₹ 58000",
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
                    text: "Credit",
                    icon: const Icon(
                      Icons.arrow_upward,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CardOne(
                    color: Colors.red.shade400,
                    text: "Debit",
                    icon: const Icon(
                      Icons.arrow_downward,
                    ),
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
      {super.key, required this.color, required this.text, required this.icon});
  final Color color;
  final String text;
  final Icon icon;
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
                text,
                style: GoogleFonts.sourceSans3(
                    fontSize: 24, fontWeight: FontWeight.w400, height: 1.2),
              ),
              Text(
                "₹ 2999",
                style: GoogleFonts.sourceSans3(
                    fontSize: 26, fontWeight: FontWeight.bold, height: 1.2),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          const SizedBox(width: 40),
          icon,
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
