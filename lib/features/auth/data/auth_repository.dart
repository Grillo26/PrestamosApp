import 'package:cobrosyprestamos/features/auth/domain/entities/user.dart';

class AuthRepository {
  //1.- Datos Simulados: Los usuarios que tenemos "Registrados"
  final List<Map<String, String>> _mockUsers = [
    {'username': 'joel', 'name': 'Joel', 'password': '1234567', 'id': '1001'},
    {'username': 'carlos', 'name': 'Carlos Enrique', 'password': '1234567', 'id': '1002'},
  ];

  //Simula el proceso de inicio de sesin consultando un servidor.
  //En el futuro, aqui pondrias la logica de httpClient o DIo
  Future<UserEntity?> login(String username, String password) async {
    //2.- Retraso; Simula la latencia (el tiempo que tarda la red en responder)
    await Future.delayed(const Duration(seconds: 2));

    //3.- Consulta: Buscamos si las credenciales coinciden con algun usuario
    final userMap = _mockUsers.firstWhere(
      (user) => user['username'] == username && user['password'] == password,
      orElse: () => {
        //Si no encuentra nada devuelve un mapa vacio
      },
    );

    //4.- Resultado: Si encontramos al usuario, lo convertimos a nuestra Entidad
    if (userMap.isNotEmpty) {
      print('Autenticación exitosa para: ${userMap['username']}');
      return UserEntity(
        id: userMap['id']!,
        username: userMap['username']!,
        name: userMap['name'],
      );
    } else {
      print('Autenticacion Fallida');
      return null;
    }
  }

  Future<void> logout() async {
    //Simulamos que el servidor tarda un poco en cerrar la sesion
    await Future.delayed(const Duration(milliseconds: 500));
    print("Sesion cerrada en el servido");
  }
}
