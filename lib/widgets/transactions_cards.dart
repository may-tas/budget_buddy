import 'package:budget_buddy/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionsCard extends StatelessWidget {
  TransactionsCard({
    super.key,
  });

  var appIcons = AppIcons();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[50],
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Recent Transactions",
                style: GoogleFonts.sourceSans3(
                    fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          ListView.builder(
              padding: EdgeInsets.all(2),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(7),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.lightBlue[50]),
                    child: ListTile(
                      minVerticalPadding: 8,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green.withOpacity(0.2)),
                        child: FaIcon(
                          appIcons.getExpenseCategoryIcons('home'),
                          size: 25,
                        ),
                      ),
                      title: const Row(
                        children: [
                          Expanded(child: Text("Car Rent Jan 2024")),
                          Text('₹ 8000', style: TextStyle(color: Colors.green))
                        ],
                      ),
                      subtitle: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Balance",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13)),
                              Spacer(),
                              Text(
                                "₹ 525",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              )
                            ],
                          ),
                          Text(
                            "21 Jan 04:51 PM",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
