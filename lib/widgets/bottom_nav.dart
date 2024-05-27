import 'package:expense_trucker/screens/add_expense.dart';
import 'package:expense_trucker/screens/home_screen.dart';
import 'package:expense_trucker/screens/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  List screens = [
    const HomeScreen(),
    const TransactionScreen(),
    const Center(child: Text("Recurring")),
    const Center(child: Text("Account")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: NavigationBar(
        height: 80,
        elevation: 0,
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        indicatorColor: const Color(0xff1a936f),
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
          NavigationDestination(
              icon: Icon(Iconsax.add_circle), label: "Transactions"),
          NavigationDestination(
              icon: Icon(Iconsax.search_favorite), label: "Recurring"),
          NavigationDestination(
              icon: Icon(Iconsax.profile_circle), label: "Account"),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AddExpense(),
              ),
            );
          },
          shape: const CircleBorder(),
          child: const Icon(
            size: 40,
            Iconsax.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
