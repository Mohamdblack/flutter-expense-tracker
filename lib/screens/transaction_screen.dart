import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
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
              const SizedBox(height: 80), //*  Add space to avoid overlap
              Expanded(child: _buildChartReport()),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3.33,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<String>(
                value: 'Monthly',
                items: ['Monthly', 'Annually', 'Weekly'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (_) {},
                dropdownColor: const Color(0xff1a936f),
                style: const TextStyle(color: Colors.white),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.circle, color: Colors.green, size: 13),
                      Text(' Income',
                          style: GoogleFonts.poppins(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      const Icon(Icons.circle, color: Colors.yellow, size: 13),
                      Text(' Expense',
                          style: GoogleFonts.poppins(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSpendingWallet() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.savings_outlined,
                  color: Color(0xff1a936f),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Income',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$120 more than june',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  '\$192',
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
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.note,
                  color: Color(0xff1a936f),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Expense',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$215 more than june',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  '\$313.31',
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
          ],
        ),
      ),
    );
  }

  Widget _buildChartReport() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: SfCircularChart(
            borderWidth: 15,
            title: const ChartTitle(text: 'Sales by Category'),
            legend: const Legend(isVisible: true),
            series: <PieSeries<ChartData, String>>[
              PieSeries<ChartData, String>(
                dataSource: getChartData(),
                xValueMapper: (ChartData data, _) => data.category,
                yValueMapper: (ChartData data, _) => data.value,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<ChartData> getChartData() {
    final List<ChartData> chartData = [
      ChartData('Electronics', 35),
      ChartData('Fashion', 28),
      ChartData('Groceries', 34),
      ChartData('Home & Kitchen', 52),
      ChartData('Other', 40)
    ];
    return chartData;
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

class ChartData {
  ChartData(this.category, this.value);
  final String category;
  final double value;
}
