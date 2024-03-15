import 'package:eventview_application_1/presentation/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingStudent extends StatelessWidget {
  const SettingStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar( 
          backgroundColor: Colors.transparent,
          title: Align(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text( 'Configuraciones',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  ),),
                IconButton(color: Colors.black,
                onPressed: (){
                  context.goNamed('lobbyStudent');
                }, icon:const Icon(Icons.arrow_back)),
              ],
            ),),
        ),
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.account_circle_rounded, size: 200),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Color del botón
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      // Aquí va la lógica de inicio de sesión
                      context.goNamed('camera');
                    },
                    child: const Icon(Icons.camera_alt),
                  ),
                  const SizedBox(height: 30.0),
                  RowElevatedButtonCustom(
                    label: 'Perfil',
                    leadingIcon: Icons.account_circle_outlined,
                    trailingIcon: Icons.arrow_forward,
                    onPressed: () {
                      context.goNamed('settingProfi');
                      MainAxisAlignment.center;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  RowElevatedButtonCustom(
                    label: 'Cuenta',
                    leadingIcon: Icons.mail,
                    trailingIcon: Icons.arrow_forward,
                    onPressed: () {
                      context.goNamed('settingAccount');
                      MainAxisAlignment.center;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  RowElevatedButtonCustom(
                    label: 'Seguridad',
                    leadingIcon: Icons.security,
                    trailingIcon: Icons.arrow_forward,
                    onPressed: () {
                      context.goNamed('settingSecure');
                      MainAxisAlignment.center;
                    },
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
