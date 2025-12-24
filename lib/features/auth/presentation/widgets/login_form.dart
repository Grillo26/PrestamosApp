import 'package:cobrosyprestamos/features/auth/data/auth_repository.dart';
import 'package:cobrosyprestamos/features/auth/domain/entities/user.dart';
import 'package:cobrosyprestamos/features/main/presentation/screens/main_navigation_screen.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Instanciamos el servicio (pieza de la capa data)
  final AuthRepository _authRepository = AuthRepository();

  bool _isLoading = false;

  //Funcion que se llama al presionar el boton
  void _submitLogin() async {
    //1.- Validacion local si los campos esta vacios
    if (!_formKey.currentState!.validate()) {
      return;
    }

    //2.- Inicio de Carga: Notificacmos a flutter que vamos a esperar
    setState(() {
      _isLoading = true;
    });

    final username = _username.text;
    final password = _passwordController.text;

    //3.- Llamamos al servicio que simula la API esperamos la respuesta
    final user = await _authRepository.login(username, password);

    //4.- Fin de carga: Ocurra lo que ocurra el proceso termino
    setState(() {
      _isLoading = false;
    });

    //5.- Manejar Resultado
    if (user != null){
       _handleSuccesLogin(user);
    } else{
      _handleFailedLogin();
    }
  }

  void _handleSuccesLogin(UserEntity user){
    //6.- Navegacion 
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context)=> MainNavigationScreen(user: user,))
    );
  }

  void _handleFailedLogin(){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Credenciales incorrectas. Intenta nuevamente'),
        backgroundColor: Colors.red,
      )
    );
  }

  @override
  void disponse() {
    _username.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // El widget From necesito envolver todos los campos para poder validarlos juntos
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // 4.- Campo de Email
          TextFormField(
            controller: _username, //Conectamos con el controllador
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa tu correo';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          TextFormField(
            controller: _passwordController,
            obscureText: true,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Contraseña',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingrea tu contraseña';
              }

              if (value.length < 6) {
                return 'La contraseña debe tener al menos 6 caracteres';
              }
            },
          ),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _submitLogin,
              child: const Text(
                'Iniciar Sesion',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
