import 'package:cobrosyprestamos/features/auth/data/auth_repository.dart';
import 'package:cobrosyprestamos/features/auth/presentation/login_page.dart';
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
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF3F4459),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          //2.- Parte de los botones
          Row(
            children: [
              _headerButton(Icons.search, null),
              const SizedBox(width: 10),
              _headerButton(Icons.logout, () => _onLogout(context) ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerButton(IconData icon, VoidCallback? onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Stack(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon, color: Colors.black87),
          ),
        ],
      ),
    );
  }

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
