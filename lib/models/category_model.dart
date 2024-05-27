// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Category {
  IconData icon;
  Color color;
  String title;
  bool isExpense;
  DateTime date;
  double price;
  Category({
    required this.icon,
    required this.color,
    required this.title,
    required this.isExpense,
    required this.date,
    required this.price,
  });
}
