import 'package:budget_buddy/utils/validator.dart';
import 'package:budget_buddy/widgets/category_dropdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  var type = 'credit';
  var category = "Miscellaneous";
  final _formKey = GlobalKey<FormState>();
  var appValidator = AppValidator();
  bool isLoading = false;

  var amountEditingController = TextEditingController();
  var titleEditingController = TextEditingController();

  var uid = Uuid();

  Future<void> _submit(context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        int timeStamp = DateTime.now().millisecondsSinceEpoch;
        var amount = int.parse(amountEditingController.text);
        DateTime date = DateTime.now();
        var id = uid.v4();
        String monthYear = DateFormat('MMM y').format(date);

        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        if (userDoc.exists) {
          int remainingAmount = userDoc['remainingAmount'];
          int totalCredit = userDoc['totalCredit'];
          int totalDebit = userDoc['totalDebit'];

          if (type == 'credit') {
            remainingAmount += amount;
            totalCredit += amount;
          } else {
            remainingAmount -= amount;
            totalDebit += amount;
          }

          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .update({
            "remainingAmount": remainingAmount,
            "totalCredit": totalCredit,
            "totalDebit": totalDebit,
            "updatedAt": timeStamp,
          });

          var data = {
            'id': id,
            'title': titleEditingController.text,
            'amount': amount,
            'type': type,
            'timestamp': timeStamp,
            'totalCredit': totalCredit,
            'totalDebit': totalDebit,
            'remainingAmount': remainingAmount,
            'monthyear': monthYear,
            'category': category
          };

          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .collection('transactions')
              .doc(id)
              .set(data);

          Navigator.pop(context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: titleEditingController,
              validator: appValidator.validateApp(),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextFormField(
              controller: amountEditingController,
              validator: appValidator.validateApp(),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Amount"),
            ),
            const SizedBox(height: 5),
            CategoryDropDown(
              categoryType: category,
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    category = value;
                  });
                }
              },
            ),
            const SizedBox(height: 5),
            DropdownButtonFormField(
              value: 'credit',
              items: const [
                DropdownMenuItem(
                  value: "credit",
                  child: Text("Credit"),
                ),
                DropdownMenuItem(
                  value: "debit",
                  child: Text("Debit"),
                )
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    type = value;
                  });
                }
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (!isLoading) {
                  _submit(context);
                }
              },
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text(
                      "Add Transaction",
                      style: TextStyle(color: Colors.green),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
