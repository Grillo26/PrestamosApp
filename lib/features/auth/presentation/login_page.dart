import 'package:cobrosyprestamos/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: Center(
        child: SingleChildScrollView( //SingleChildScrollView -> para que el teclado no tape nada
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          child: Column(
  
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/login_hero.png', height: 280,),

              SizedBox(height: 30,),

              LoginForm()

            ],

          ),

        ),
      ),
    );
  }
}
