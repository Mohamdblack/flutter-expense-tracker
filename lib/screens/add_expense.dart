import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:expense_trucker/screens/expense_screen.dart';
import 'package:expense_trucker/screens/income_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  List<String> expeseNames = [
    'Income',
    'Expense',
    'Transfer',
  ];

  String _selectedExpenseName = "Income";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1a936f),
        foregroundColor: Colors.white,
        title: const Text("Add Expense"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropdown<String>(
                decoration: CustomDropdownDecoration(
                  closedBorder: Border.all(),
                  expandedBorder: Border.all(),
                  closedFillColor: Colors.grey[300],
                  expandedFillColor: Colors.grey[300],
                  headerStyle: GoogleFonts.poppins(
                    fontSize: 22,
                  ),
                  listItemStyle: GoogleFonts.poppins(
                    fontSize: 22,
                  ),
                ),
                hintText: 'Select An Expense',
                items: expeseNames,
                initialItem: expeseNames[0],
                onChanged: (value) {
                  setState(() {
                    _selectedExpenseName = value;
                    log('changing value to: $value');
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              _selectedExpenseName == "Income"
                  ? const IncomeScreen()
                  : _selectedExpenseName == "Expense"
                      ? const ExpenseScreen()
                      : const Text("Transfer")
            ],
          ),
        ),
      ),
    );
  }
}
