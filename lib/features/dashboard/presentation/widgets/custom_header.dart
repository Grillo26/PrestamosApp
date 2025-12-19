import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String userName;
  const CustomHeader({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //1.- Parte del saludo
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hola,",
                style: TextStyle(fontSize: 28, color: Color(0xFF404454)),
              ),
              Text(
                "$userName!",
                style: TextStyle(fontSize: 30, color: Color(0xFF3F4459), fontWeight: FontWeight.bold),
              ),
            ],
          ),
      
          //2.- Parte de los botones
          Row(
            children: [
              _headerButton(Icons.search),
              const SizedBox(width: 10),
              _headerButton(Icons.notifications_none, hasBadge: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerButton(IconData icon, {bool hasBadge = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Stack(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(icon, color: Colors.black87),
          ),
          if (hasBadge)
            Positioned(
              right: 12,
              top: 12,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
