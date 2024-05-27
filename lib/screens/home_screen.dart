import 'package:expense_trucker/models/category_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> transactions = [
    Category(
      color: Colors.green,
      icon: Iconsax.music4,
      title: "Spotify subscription",
      price: 14.7,
      isExpense: true,
      date: DateTime(2024, 5, 29, 15, 30),
    ),
    Category(
      color: Colors.blueAccent,
      icon: Iconsax.wallet4,
      title: "skateBoard",
      price: 8.7,
      isExpense: true,
      date: DateTime.now(),
    ),
    Category(
      color: Colors.greenAccent,
      icon: Icons.savings,
      title: "Saving",
      price: 300,
      isExpense: false,
      date: DateTime.now(),
    ),
    Category(
      color: Colors.yellowAccent,
      icon: Iconsax.money,
      title: "salary",
      price: 1000,
      isExpense: false,
      date: DateTime(2024, 7, 6, 08, 30),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color(0xff1a936f),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Iconsax.setting_2, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.notification, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildBalanceOverview(context),
              const SizedBox(height: 50), // Add space to avoid overlap
              Expanded(child: _buildRecentTransactions(context)),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height /
                3, // Adjust this value to position the card
            left: 16,
            right: 16,
            child: _buildSpendingWallet(),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceOverview(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.7,
      color: const Color(0xff1a936f),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'TODAY IS',
            style: GoogleFonts.poppins(color: Colors.grey[200], fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            'Fri, 21 Jul',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            'THIS MONTH\'S SPEND',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 10),
          Text(
            '\$313.31',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '67% below last month',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.height / 15,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    color: Colors.grey[300],

                    spots: [
                      const FlSpot(0, 1),
                      const FlSpot(1, 1),
                      const FlSpot(1, 2),
                      const FlSpot(2, 2),
                      const FlSpot(2, 3),
                      const FlSpot(3, 3),
                      const FlSpot(3, 4),
                      const FlSpot(4, 4),
                    ],
                    isCurved: false,
                    // colors: [Colors.white],
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: true),
                  ),
                ],
                lineTouchData: const LineTouchData(enabled: false),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpendingWallet() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Iconsax.wallet4,
              color: Color(0xff1a936f),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Spending Wallet',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Text(
              '\$5,631.22',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentTransactions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Iconsax.refresh),
              const SizedBox(
                width: 10,
              ),
              const Text(" | "),
              Text(
                "sync Now",
                style: GoogleFonts.poppins(
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'RECENT TRANSACTIONS',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              Text(
                'See all',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
                final String formattedDate =
                    formatter.format(transactions[index].date);
                return _buildTransactionItem(
                    transactions[index].title,
                    transactions[index].isExpense
                        ? '-\$${transactions[index].price}'
                        : '+\$${transactions[index].price}',
                    formattedDate,
                    transactions[index].icon,
                    transactions[index].color,
                    transactions[index].isExpense);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(String title, String amount, String date,
      IconData icon, Color color, bool isExpense) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        icon,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: GoogleFonts.aBeeZee(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(date,
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                amount,
                style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: isExpense ? Colors.red : Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
