import 'package:eventview_application_1/presentation/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset('assets/svg/logo.svg'),
                  ),
                ),
                const SizedBox(height: 8), // Espacio entre el logo y el botón
                const CircleAvatar(
                  radius: 120, // Cambia el tamaño de la imagen redonda
                  backgroundImage: AssetImage(
                      'assets/images/image_start_movil.jpg'), // Reemplaza 'assets/tu_imagen.png' con la ruta de tu imagen
                ),
                const SizedBox(
                    height: 15), // Espacio entre la imagen y el botón
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(15, 22, 81, 1),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    context.goNamed('signIn');
                  },
                  child: const Text('Iniciar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
