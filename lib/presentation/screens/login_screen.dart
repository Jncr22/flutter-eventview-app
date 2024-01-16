import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Correo'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                // Aquí va la lógica de inicio de sesión
                context.goNamed('lobby');
              },
              child: const Text('Iniciar sesión'),
            ),
            TextButton(
              onPressed: () {
                context.goNamed('register');
              },
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}

//no puedo modificar nada del login,registrese, start,tabbar widgets student, screen.dart, main dart.