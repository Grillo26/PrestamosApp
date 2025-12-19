// El cuadro de total en caja
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceCard extends StatelessWidget {
  final double amount;
  BalanceCard({required this.amount, super.key});
  final formatter = NumberFormat('#,##0.00', 'bs');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0XFFf3efee), Color(0xFFb7b1f7)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Total Caja Actual",
            style: TextStyle(color: Color(0xFF9794A6), fontSize: 16),
          ),
          const SizedBox(height: 2),
          Text(
            "Bs ${formatter.format(amount)}",
            style: const TextStyle(
              color: Color(0xFF353956),
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
