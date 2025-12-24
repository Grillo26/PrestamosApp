import 'package:cobrosyprestamos/features/auth/domain/entities/user.dart';
import 'package:cobrosyprestamos/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class MainNavigationScreen extends StatefulWidget {
  final UserEntity user;
  const MainNavigationScreen({super.key, required this.user});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  //1.- Este es el indice que dice que pestana esta activa empieza en 0
  int _selectIndex = 0;

  //2.- Lista de Pantalla que queremos mostrar
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      DashboardPage(user: widget.user), // Pantalla 0
      const Center(child: Text("Pantalla de Prestamos")),
      const Center(child: Text("Pantalla de Clientes")),
    ];
  }

  //3.- Funcion para cambiar de pesta;a
  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectIndex],

      //4.- Nuestra barra
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex, //Que pestana brilla
        onTap: _onItemTapped, //Que pasa cuando tocas
        selectedItemColor: const Color(0xFF6A2DFA),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined) ,
            label: 'Inicio'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Prestamos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'Perfil'
          )
        ],
      ),
    );
  }
}
