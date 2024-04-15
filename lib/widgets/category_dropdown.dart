import 'package:budget_buddy/utils/app_icons.dart';
import 'package:flutter/material.dart';

class CategoryDropDown extends StatefulWidget {
  const CategoryDropDown(
      {super.key, this.categoryType, required this.onChanged});

  final String? categoryType;
  final ValueChanged<String?> onChanged;

  @override
  State<CategoryDropDown> createState() => _CategoryDropDownState();
}

class _CategoryDropDownState extends State<CategoryDropDown> {
  var appIcons = AppIcons();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: widget.categoryType,
        isExpanded: true,
        hint: const Text('Select Category'),
        items: appIcons.hostelExpensesCategories
            .map((e) => DropdownMenuItem<String>(
                value: e['name'],
                child: Row(
                  children: [
                    Icon(
                      e['icon'],
                      color: Colors.black87,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      e['name'],
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                )))
            .toList(),
        onChanged: widget.onChanged);
  }
}
