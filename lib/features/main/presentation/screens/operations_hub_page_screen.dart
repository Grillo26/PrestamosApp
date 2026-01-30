import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OperationsHub extends StatelessWidget {
  const OperationsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Text('Registro Nuevo', 
                style: TextStyle(
                  color: Color(0xff353956),
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _card('assets/icons/ultimoPago.svg', 'Cliente Nuevo'),
                  SizedBox(width: 20),
                  _card('assets/icons/totalVentas.svg', 'Registrar Pago', isCard: true),
                ],
              ),
              SizedBox(height: 10),
              _card('assets/icons/totalGastos.svg', 'Registrar Gasto'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _card(assetPath, title, {bool isCard = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: isCard
      ? BoxDecoration(
          color: Color(0XFFf3efee),
          borderRadius: BorderRadius.circular(20)
        )
      : BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFb7b1f7), Color(0XFFf3efee)],
        ),
        borderRadius: BorderRadius.circular(20),
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _iconCard(assetPath, isCard),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              color: Color(0xff353956),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconCard(assetPath, isCard) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: BoxBorder.all(color: Color(0xFFb7b1f7)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(
          assetPath,
          fit: BoxFit.contain,
          colorFilter: ColorFilter.mode(
            isCard
            ?const Color(0xFF353956)
            : const Color(0xFF6A2DFA), 
          BlendMode.srcIn),
        ),
      ),
    );
  }
}
