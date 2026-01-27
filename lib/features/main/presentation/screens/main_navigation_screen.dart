import 'package:cobrosyprestamos/features/auth/domain/entities/user.dart';
import 'package:cobrosyprestamos/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      const Center(child: Text("Pantalla de Todos los usuarios")),
      const Center(child: Text("Pantalla Nuevo Registro")),
      const Center(child: Text("Pantalla de Transacciones")),
      const Center(child: Text("Calculadora")),
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
      extendBody: true,
      body: IndexedStack(
        index: _selectIndex,
        children:_pages,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6A2DFA),
        shape: const CircleBorder(),
        onPressed: () => setState(() {
          _selectIndex = 2;
        }),
        child: const Icon(Icons.add, color: Colors.white, size: 30,),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //4.- Nuestra barra
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 65,
        color: Colors.white,
        shape: const CircularNotchedRectangle(), //Crear el hueco circular
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //Lado izquierdo
            _buildNavItem('assets/icons/home.svg', 0),
            _buildNavItem('assets/icons/clientes.svg', 1),

            const SizedBox(width: 40),

            _buildNavItem('assets/icons/lista.svg', 3),
            _buildNavItem('assets/icons/calculadora.svg', 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String assetPath, int index) {
    final isSelected = _selectIndex == index;
    return IconButton(
      icon: SvgPicture.asset(
        assetPath,
        colorFilter: ColorFilter.mode(
          isSelected ? const Color(0xFF6A2DFA) : const Color(0xFF353956),
          BlendMode.srcIn
        ),
      ),
      onPressed: () => setState(() {
        _selectIndex = index;
      }),
    );
  }
}
