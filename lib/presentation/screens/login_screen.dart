import 'package:eventview_application_1/auth_service.dart';
import 'package:eventview_application_1/presentation/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthService _authService =
      AuthService(); // Inicializa el servicio de autenticación

  LoginScreen({super.key});

  // login_screen.dart
// login_screen.dart
  Future<void> _signIn(BuildContext context) async {
    try {
      UserCredential? userCredential = await _authService.signIn(
        emailController.text,
        passwordController.text,
      );
      if (userCredential != null) {
        // Usa el nuevo método para obtener la categoría del usuario
        String? category =
            await _authService.getUserCategory(userCredential.user!.uid);
        if (category != null) {
          // Navega a la pantalla principal según la categoría del usuario
          if (category == 'Alumno') {
            context.goNamed('lobbyStudent');
          } else if (category == 'Profesor') {
            context.goNamed('lobby');
          } else {
            print('Categoría de usuario desconocida');
          }
        } else {
          print('No se pudo obtener la categoría del usuario');
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No se encontró ningún usuario con ese correo electrónico.');
      } else if (e.code == 'wrong-password') {
        print('La contraseña proporcionada es incorrecta.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Iniciar sesión',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.red, // Cambia el color para diferenciarlo
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  UserCredential? userCredential =
                      await _authService.signInWithGoogle();
                  if (userCredential != null) {
                    // Obtiene la categoría del usuario de Firestore
                    String? category = await _authService
                        .getUserCategory(userCredential.user!.uid);
                    if (category != null) {
                      // Navega a la pantalla principal según la categoría del usuario
                      if (category == 'Alumno') {
                        context.goNamed('lobbyStudent');
                      } else if (category == 'Profesor') {
                        context.goNamed('lobby');
                      } else {
                        print('Categoría de usuario desconocida');
                        // Opcional: Navegar a una pantalla de error o de configuración
                      }
                    } else {
                      print('No se pudo obtener la categoría del usuario');
                      // Opcional: Navegar a una pantalla de error o de configuración
                    }
                  }
                },
                child: const Text('Iniciar sesión con Google'),
              ),
              const SizedBox(height: 20.0),
              TextFieldCustom(
                controller: emailController,
                labelText: 'Correo electrónico',
                hintText: 'Correo electrónico',
                fontSize: 16.0,
                constraints: const BoxConstraints(minWidth: 100, maxWidth: 350),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              TextFieldCustom(
                controller: passwordController,
                labelText: 'Contraseña',
                hintText: 'Contraseña',
                fontSize: 16.0,
                constraints: const BoxConstraints(minWidth: 100, maxWidth: 350),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => _signIn(context),
                child: const Text('Iniciar sesión'),
              ),
              TextButton(
                onPressed: () {
                  context.goNamed('register');
                },
                child: const Text('Registrarse'),
              ),
              TextButton(
                onPressed: () {
                  context.goNamed('lobbyStudent');
                },
                child: const Text('Estudiante'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//no puedo modificar nada del login,registrese, start,tabbar widgets student, screen.dart, main dart.