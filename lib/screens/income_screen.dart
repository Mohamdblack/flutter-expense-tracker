import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../models/cat_model.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({super.key});

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen>
    with SingleTickerProviderStateMixin {
  final List<Categ> incomeCategories = [
    Categ(name: 'Salary', icon: Icons.attach_money, color: Colors.green),
    Categ(name: 'Bonus', icon: Icons.card_giftcard, color: Colors.blue),
    Categ(name: 'Interest', icon: Icons.interests, color: Colors.orange),
    Categ(name: 'Investment', icon: Icons.trending_up, color: Colors.purple),
    Categ(name: 'Rental Income', icon: Icons.house, color: Colors.brown),
    Categ(name: 'Freelance', icon: Icons.work, color: Colors.teal),
    Categ(name: 'Dividends', icon: Icons.pie_chart, color: Colors.amber),
    Categ(name: 'Gifts', icon: Icons.card_giftcard, color: Colors.pink),
    Categ(name: 'Selling', icon: Icons.sell, color: Colors.cyan),
    Categ(name: 'Others', icon: Icons.more_horiz, color: Colors.grey),
  ];

  List<String> expeseNames = [
    'Income',
    'Expense',
    'Transfer',
  ];
  final TextEditingController _expenseNameController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  IconData _selectedCategoryIcon = Iconsax.category;
  Color _selectedCategoryColor = Colors.transparent;
  String _selectedCategoryName = "";
  String? _selectedMethod;

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _dateController.text = DateFormat('dd/MM/yyyy').format(
      DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _amountController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Income Amount',
            prefixIcon: Icon(Iconsax.money_25),
            prefixText: '\$',
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        const Text('Select a Category'),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return _buildCategoryBottomSheet();
                },
              );
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: _selectedCategoryName,
              hintStyle: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
              prefixIcon: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    color: _selectedCategoryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    _selectedCategoryIcon,
                    size: 30,
                  )),
            ),
            readOnly: true,
          ),
        ),
        const SizedBox(height: 16),
        const Text('Date'),
        const SizedBox(height: 8),
        TextField(
          controller: _expenseNameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Note',
            prefixIcon: Icon(Icons.note),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: DropdownButton<String>(
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                padding: const EdgeInsets.all(10),
                value: _selectedMethod,
                hint: const Text('Select An Account'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedMethod = newValue;
                  });
                },
                items: const [
                  DropdownMenuItem<String>(
                    value: 'cash',
                    child: Row(
                      children: [
                        Icon(Icons.money),
                        SizedBox(width: 10),
                        Text('Cash'),
                      ],
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'evc',
                    child: Row(
                      children: [
                        Icon(Icons.mobile_friendly),
                        SizedBox(width: 10),
                        Text('EVC Plus+'),
                      ],
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'bank',
                    child: Row(
                      children: [
                        Icon(Icons.account_balance),
                        SizedBox(width: 10),
                        Text('Bank'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _dateController,
          onTap: () async {
            DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime.now().subtract(const Duration(days: 1460)),
              lastDate: DateTime.now().add(const Duration(days: 1460)),
              onDatePickerModeChange: (value) {
                log(value.toString());
              },
            );
            if (newDate != null) {
              setState(() {
                _dateController.text = DateFormat('dd/MM/yyyy').format(
                  newDate,
                );
                selectedDate = newDate;
              });
            }
          },
          readOnly: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Iconsax.clock,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xff1a936f),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'Add',
              style: GoogleFonts.poppins(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryBottomSheet() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        ListTile(
          trailing: Container(
            decoration: BoxDecoration(
              color: const Color(0xff1a936f),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Iconsax.add_circle,
                color: Colors.white,
              ),
              label: Text(
                "Add Category",
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          title: Text(
            'Select a Category',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Divider(),
        Expanded(
          child: ListView.builder(
            itemCount: incomeCategories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    setState(() {
                      _selectedCategoryIcon = incomeCategories[index].icon;
                      _selectedCategoryColor = incomeCategories[index].color;
                      _selectedCategoryName = incomeCategories[index].name;
                    });
                    Navigator.pop(context);
                    log(incomeCategories[index].name);
                  },
                  leading: Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: incomeCategories[index].color,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      incomeCategories[index].icon,
                    ),
                  ),
                  title: Text(
                    incomeCategories[index].name,
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
