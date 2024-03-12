import 'package:flutter/material.dart';
import 'package:eventview_application_1/presentation/screens.dart';
import 'package:eventview_application_1/presentation/widgets/logo_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: LogoView(),
        ),
      ),
      body: const Stack(
        children: [
          IconsButtonDownBar(
            leftButtonIcon:
                Icons.settings, // Icono personalizado para el botón izquierdo
            rightButtonIcon:
                Icons.exit_to_app, // Icono personalizado para el botón derecho
            iconSize: 40.0,
          ),
          Center(
            widthFactor: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle_sharp, size: 150),
                  SizedBox(height: 30.0),
                  TextFieldCustom(
                      labelText: 'Nombre',
                      hintText: 'Isai Chi Lanestoza',
                      fontSize: 16.0,
                      constraints: BoxConstraints(
                          minWidth: 100,
                          maxWidth: 350), // Define restricciones de tamaño
                      keyboardType: TextInputType.emailAddress),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(),
                      TextFieldCustom(
                          labelText: 'Nómina',
                          hintText: '99999',
                          fontSize: 16.0,
                          constraints:
                              BoxConstraints(minWidth: 100, maxWidth: 350),
                          keyboardType: TextInputType.number),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
