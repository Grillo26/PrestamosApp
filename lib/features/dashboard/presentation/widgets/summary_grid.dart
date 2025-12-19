// la lista de movimientosm
import 'package:flutter/material.dart';

class SummaryGrid extends StatelessWidget {
  const SummaryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      _miniCard("Prestamos", "8,500", Colors.orange),
      const SizedBox(height: 15,),
      _miniCard("Cobros", "33222", Colors.green)
      ],
    );
  }

  Widget _miniCard(String title, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14),),
            const SizedBox(height: 5,),
            Text(value, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
