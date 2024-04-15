import 'package:budget_buddy/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  TransactionCard({
    super.key,
    required this.data,
  });

  var appIcons = AppIcons();
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(data['timestamp']);
    String formattedDate = DateFormat('d MMM hh:mma').format(date);
    return Padding(
      padding: const EdgeInsets.all(7),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.lightBlue[50]),
        child: ListTile(
          minVerticalPadding: 8,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          leading: Container(
            padding: const EdgeInsets.all(10),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: data['type'] == 'credit'
                    ? Colors.green.withOpacity(0.2)
                    : Colors.red.withOpacity(0.2)),
            child: FaIcon(
              appIcons.getExpenseCategoryIcons('${data['category']}'),
              size: 25,
              color: data['type'] == 'credit' ? Colors.green : Colors.red,
            ),
          ),
          title: Row(
            children: [
              Expanded(child: Text("${data['title']}")),
              Text('${data['type'] == 'credit' ? '+' : '-'}₹${data['amount']}',
                  style: TextStyle(
                      color:
                          data['type'] == 'credit' ? Colors.green : Colors.red))
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text("Balance",
                      style: TextStyle(color: Colors.grey, fontSize: 13)),
                  const Spacer(),
                  Text(
                    "₹ ${data['remainingAmount']}",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  )
                ],
              ),
              Text(
                formattedDate,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
