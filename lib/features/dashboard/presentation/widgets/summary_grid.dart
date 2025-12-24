// la lista de movimientosm
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 

class SummaryGrid extends StatelessWidget {
  const SummaryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Resumen',
              style: TextStyle(
                color: Color(0xFF535863),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Row(
            children: [
              _card('assets/icons/ultimoPago.svg', 'Último Pago', '1000','sdfsdf', isCard: true),
              SizedBox(width: 10,),
              _card('assets/icons/totalVentas.svg', 'Total Ventas', '2330','Hace 10 min', isCard: false)
            ]
          ),

          SizedBox(height: 10,),
          
          Row(
            children: [
              _card('assets/icons/totalCobrado.svg', 'Total Cobrado', '1000', 'Hace 20 min', isCard: true),
              SizedBox(width: 10,),
              _card('assets/icons/totalGastos.svg', 'Total Gastos', '2330', 'Hace 10 min', isCard: false)
            ],
          )
        ],
      ),
    );
  }

  Widget _card(String assetPath, String title, String cantidad, String tiempo, {bool isCard = true}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: isCard 
        ? BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFb7b1f7), Color(0XFFf3efee)],
          ),
          borderRadius: BorderRadius.circular(20),
          border: BoxBorder.all(color: Color(0xFFb7b1f7)),
        ) 
        : BoxDecoration(
          color: Color(0XFFf3efee),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _iconCard(assetPath, isCard),
            SizedBox(height: 10,),
            Text(
              title,
              style: TextStyle(
                color: Color(0xFF353956),
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            Text(
              "Bs. $cantidad",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF353956),
              ),
            ),
            Text(
              tiempo,
              style: isCard 
              ? TextStyle( color: Color(0xFFB28DE7), fontWeight: FontWeight.bold)
              : TextStyle( color: Color(0xFF878991))
            )
            
          ],
        ),
      ),
    );
  }


  Widget _iconCard(assetPath, isCard) {
    return Container(
      width: 48,  // Tamaño fijo para el círculo
      height: 48, // Tamaño fijo para el círculo
      decoration: isCard 
      ? BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: BoxBorder.all(color: Color(0xFFb7b1f7)),
      )
      : BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0), // Padding reducido
        child: SvgPicture.asset(
          assetPath,
          fit: BoxFit.contain, // Ajusta el SVG dentro del espacio disponible
          colorFilter: ColorFilter.mode(
            isCard 
            ? const Color(0xFF6A2DFA)
            : const Color(0xFF353956),
            BlendMode.srcIn
          ),
        ),
      ),
    );
  }
}
