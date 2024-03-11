import 'package:eventview_application_1/auth_service.dart';
import 'package:eventview_application_1/presentation/screens.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class RegistrationScreen extends StatelessWidget {
 final emailController = TextEditingController();
 final passwordController = TextEditingController();
  final AuthService _authService = AuthService();

 RegistrationScreen({super.key});

 @override
 Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Cambia el color para diferenciarlo
                      foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                      UserCredential? userCredential = await _authService.signInWithGoogle();
                      if (userCredential != null) {
                        // Navegar a la pantalla principal después del inicio de sesión exitoso
                        context.goNamed('lobby');
                      }
                  },
                  child: const Text('Iniciar sesión con Google'),
                  ),
                const SizedBox(height: 30.0),
                TextFieldCustom(
                 controller: emailController,
                 labelText: 'Correo',
                 hintText: 'Correo electrónico',
                 fontSize: 16.0,
                 constraints: BoxConstraints(minWidth: 100, maxWidth: 350),
                 keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16.0),
                TextFieldCustom(
                 controller: passwordController,
                 labelText: 'Contraseña',
                 hintText: 'Contraseña',
                 fontSize: 16.0,
                 constraints: BoxConstraints(minWidth: 100, maxWidth: 350),
                 keyboardType: TextInputType.visiblePassword,
                 obscureText: true,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                 onPressed: () async {
                    UserCredential? userCredential = await _authService.signUp(
                      emailController.text,
                      passwordController.text,
                    );
                    if (userCredential != null) {
                      // Navegar a la pantalla principal después del registro exitoso
                      context.goNamed('lobby');
                    }
                 },
                 child: const Text('Registrarse'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
 }
}

