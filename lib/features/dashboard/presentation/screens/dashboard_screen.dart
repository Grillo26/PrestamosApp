import 'package:cobrosyprestamos/features/auth/data/auth_repository.dart';
import 'package:cobrosyprestamos/features/auth/domain/entities/user.dart';
import 'package:cobrosyprestamos/features/auth/presentation/login_page.dart';
import 'package:cobrosyprestamos/features/dashboard/presentation/widgets/balance_card.dart';
import 'package:cobrosyprestamos/features/dashboard/presentation/widgets/custom_header.dart';
import 'package:cobrosyprestamos/features/dashboard/presentation/widgets/summary_grid.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final UserEntity user;

  const DashboardPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 248, 251),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //1.- Custom Header saludo y buscador
              CustomHeader(userName: user.name ?? 'Usuario',),

              const SizedBox(height: 20),

              //2.- Cuadro principal: Total en caja
              BalanceCard(amount: 2000),

              const SizedBox(height: 20),

              //3.- Grid de Resumenes
              const SummaryGrid(),

              //Intentando boton
              SizedBox(
                child: IconButton(
                  onPressed: () => _onLogout(context),
                  icon: const Icon(Icons.exit_to_app),
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Para cerrar sesion
  void _onLogout(BuildContext context) async {
    final autRepo = AuthRepository();
    await autRepo.logout();

    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false,
      );
    }
  }
}
