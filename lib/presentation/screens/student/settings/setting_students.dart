import 'package:eventview_application_1/presentation/screens.dart';
import 'package:eventview_application_1/presentation/widgets/logo_widget.dart';
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
          title: const Align(
            alignment: Alignment.center,
            child: LogoView(),
          ),
        ),
        body: Stack(
          children: [
<<<<<<< HEAD
             Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_sharp),
                          onPressed:() {
                      context.goNamed('settings');
                      } ,
                        )
                      ),
                    ],
                  ),
=======
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_sharp),
                      onPressed: () {
                        context.goNamed('');
                      },
                    )),
              ],
            ),
>>>>>>> 81042d2f984f47eaaec50943218ff3f1a1108adf
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
