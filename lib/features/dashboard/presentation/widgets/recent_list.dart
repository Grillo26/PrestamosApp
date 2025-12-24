//Los cuadros de otros resumenes

import 'package:flutter/material.dart';

class RecentList extends StatelessWidget {
  const RecentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Transacciones Recientes',
          style: TextStyle(
            color: Color(0xFF535863),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Column(children: [
          _cardCliente(),
          SizedBox(height: 10,),
          _cardCliente(),
          SizedBox(height: 10,),
          _cardCliente(),
          SizedBox(height: 10,),
          _cardCliente(),
        ]
      ),
      ],
    );
  }

  Widget _cardCliente() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      padding: EdgeInsets.all(10.0),
      child: Row(children: [
        
        _iconCard(),
      
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Carlos Enrique Mamani Torrez',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF6B6E77),
                  fontWeight: FontWeight.w400
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '21 sep, 03:22 Pm',
                style: TextStyle(
                  color: Color(0xFFA6A8AB),
                ),
              )
            ],
          ),
        ),
        const Spacer(),
        Text(
          '-Bs.120',
          style: TextStyle( color: Color(0xFF67E967), fontWeight: FontWeight.w500),
          
          
        )
      ]
        ),
    );
  }

  Widget _iconCard() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Color(0xFFF1F3F6),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Icon(Icons.person),
      ),
    );
  }
}
