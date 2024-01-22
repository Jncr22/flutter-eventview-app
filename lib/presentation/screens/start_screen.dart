import 'package:eventview_application_1/presentation/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Aquí iría el resto de tu interfaz de usuario...
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Transform.translate(
                  offset: const Offset(0, -150), // Mueve el logo 150px hacia arriba
                  child: const Align(
                    alignment: Alignment.center,
                    child: LogoView(
                      fontSize: 50.0, // Tamaño de la fuente para el logo
                      textColor: Colors.black, // Color del texto para el logo
                      // No es necesario especificar el color del punto (dotColor) si quieres que sea amarillo por defecto
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 0), // Espacio entre el logo y el botón
              const CircleAvatar(
                radius: 80, // Cambia el tamaño de la imagen redonda
                backgroundImage: AssetImage('assets/tu_imagen.png'), // Reemplaza 'assets/tu_imagen.png' con la ruta de tu imagen
              ),
              const SizedBox(height: 10), // Espacio entre la imagen y el botón
              ElevatedButton(
                onPressed: () {
                  context.goNamed('signIn');
                },
                child: const Text('Iniciar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


