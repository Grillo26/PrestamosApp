import 'package:cobrosyprestamos/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: Center(
        child: SingleChildScrollView( //SingleChildScrollView -> para que el teclado no tape nada
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sistema de Cobros',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent
                ),
              ),

              SizedBox(height: 50,),

              LoginForm()
            ],

          ),

        ),
      ),
    );
  }
}
