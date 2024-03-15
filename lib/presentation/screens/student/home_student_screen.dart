import 'package:eventview_application_1/presentation/screens.dart';
import 'package:eventview_application_1/presentation/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class HomeStudentView extends StatelessWidget {
  const HomeStudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: LogoView(),
        ),actions: <Widget>[
            IconButton(onPressed: () => (), icon: const Icon(Icons.search),iconSize: 40.0,)
          ],
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
                          labelText: 'Matricula',
                          hintText: '99999',
                          fontSize: 16.0,
                          constraints:
                              BoxConstraints(minWidth: 100, maxWidth: 120),
                          keyboardType: TextInputType.number),
                      SizedBox(width: 80.0, height: 30.0),
                      TextFieldCustom(
                          labelText: 'Grupo',
                          hintText: 'TI 91',
                          fontSize: 16.0,
                          constraints: BoxConstraints(
                              minWidth: 100,
                              maxWidth: 150), // Define restricciones de tamaño
                          keyboardType: TextInputType.text),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 16.0, width: 6),
                      Center(
                        child: Text(
                          'Horas Extrariculares: ',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextFieldCustom(
                          labelText: '',
                          hintText: '250',
                          fontSize: 16.0,
                          constraints: BoxConstraints(
                              minWidth: 80,
                              maxWidth: 170), // Define restricciones de tamaño
                          keyboardType: TextInputType.number),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
