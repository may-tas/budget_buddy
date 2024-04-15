import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppIcons {
  final List<Map<String, dynamic>> hostelExpensesCategories = [
    {
      "name": "Gas Filling",
      "icon": FontAwesomeIcons.gasPump,
    },
    {
      "name": "Shopping",
      "icon": FontAwesomeIcons.cartShopping,
    },
    {
      "name": "Drinks",
      "icon": FontAwesomeIcons.mugSaucer,
    },
    {
      "name": "Phone Recharge",
      "icon": FontAwesomeIcons.mobile,
    },
    {
      "name": "Dining Out",
      "icon": FontAwesomeIcons.hotel,
    },
    {
      "name": "Order",
      "icon": FontAwesomeIcons.pizzaSlice,
    },
    {
      "name": "Entertainment",
      "icon": FontAwesomeIcons.film,
    },
    {
      "name": "Healthcare",
      "icon": FontAwesomeIcons.suitcaseMedical,
    },
    {
      "name": "Transportation",
      "icon": FontAwesomeIcons.car,
    },
    {
      "name": "Miscellaneous",
      "icon": FontAwesomeIcons.cartPlus,
    },
  ];

  IconData getExpenseCategoryIcons(String categoryName) {
    final category = hostelExpensesCategories.firstWhere(
        (category1) => category1['name'] == categoryName,
        orElse: () => {"icon": FontAwesomeIcons.cartShopping});
    return category['icon'];
  }
}
