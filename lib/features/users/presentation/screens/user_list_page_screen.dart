import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Titulo Lista de Clientes
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: Text(
                'Lista de Clientes',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff535863),
                ),
              ),
            ),

            //Barra de Busqueda
            _buildSearchBar(),

            //Lista de Clientes
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: 10, //estatico por el momento
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemBuilder: (context, index) {
                  return _customerTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Widgets Auxiliares
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffF1F3F6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Buscar Cliente',

            suffixIcon: Icon(Icons.search, color: Color(0xff6A2DFA),),
            hintStyle: TextStyle(color: Color(0xffA8A9AF)),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
        ),
      ),
    );
  }

  Widget _customerTile() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration:  BoxDecoration(
        color: Color(0xffF7F7FB)
      ),
      child: Row(
        children: [
          //Avatar o icono circular
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xffF1F3F6),
              shape: BoxShape.circle,
            ),
            child: Padding( //Icono persona proximamente convertir a widget
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                'assets/icons/person.svg',
                fit: BoxFit.contain,
                colorFilter: ColorFilter.mode( Color(0xff3F4459), BlendMode.srcIn),
              ),
            ),
          ),

          const SizedBox(width: 15,),

          //Informacion del Cliente
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Carlos Enrique Mamani',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Color(0xff6B6E77)
                  ),
                ),
                Text(
                  '21 Sep, 03:22 PM',
                  style: TextStyle(
                    color: Color(0xffA6A8AB),
                    fontSize: 16
                  ),
                )
              ],
            ),
          ),

          //Icono de Fleca de accion
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
    );
  }
}
