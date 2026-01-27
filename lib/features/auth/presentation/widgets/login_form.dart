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
  bool _isPasswordVisible = false;
  bool _remeberMe = false;

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
    if (user != null) {
      _handleSuccesLogin(user);
    } else {
      _handleFailedLogin();
    }
  }

  void _handleSuccesLogin(UserEntity user) {
    //6.- Navegacion
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => MainNavigationScreen(user: user)),
    );
  }

  void _handleFailedLogin() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Credenciales incorrectas. Intenta nuevamente'),
        backgroundColor: Colors.red,
      ),
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
    // envolver todos los campos para poder validarlos juntos
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Iniciar Sesión',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: Color(0xFF353956),
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Por favor inicie sesión para continuar',
              style: TextStyle(fontSize: 14, color: Color(0xff7C8386)),
            ),
          ),

          SizedBox(height: 30),

          _buildTextField(
            controller: _username,
            hintText: "Username",
            icon: Icons.person_outline, 
            tipoTeclado: TextInputType.text, 
            
          ),

          SizedBox(height: 20),

          _buildTextField(
            controller: _passwordController,
            hintText: 'Contraseña',
            icon: Icons.lock,
            tipoTeclado: TextInputType.number,
            isPassword: true,
            isPasswordVisible: _isPasswordVisible,
            onToggleVisibility: () {
              setState(()=> _isPasswordVisible = !_isPasswordVisible);
            },
          ),

          /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Recordar Cuenta', style: TextStyle(color: Color(0xff7C8386)),),
              Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: _remeberMe, 
                  activeColor: const Color(0xff6A2DFA),
                  onChanged: (value) => setState(() => _remeberMe = value)
                  
                ),
              )
            ],
          ),*/

          const SizedBox(height: 16),

          /*TextFormField(
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
          ),*/
          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _submitLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff6A2DFA)
              ),
              child: const Text(
                'Iniciar Sesion',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildTextField({
  required TextEditingController controller,
  required String hintText,
  required IconData icon,
  required TextInputType tipoTeclado,
  bool isPassword = false,
  bool isPasswordVisible = false,
  VoidCallback? onToggleVisibility,
}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xffF5F5F9),
      borderRadius: BorderRadius.circular(15),
    ),
    child: TextField(
      controller: controller,
      keyboardType: tipoTeclado,
      obscureText: isPassword && !isPasswordVisible,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, color: const Color(0xff3F4459)),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: onToggleVisibility,
              )
            : null,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
      ),
      
    ),
  );
}
