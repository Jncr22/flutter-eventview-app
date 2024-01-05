import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegistrationScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(labelText: 'Apellido'),
            ),
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
            TextField(
              controller: confirmPasswordController,
              decoration:
                  const InputDecoration(labelText: 'Confirmar Contraseña'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                // Aquí va la lógica de registro
                context.goNamed('home');
                //Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('Registrarse'),              
            ),
          ],
        ),
      ),
    );
  }
}
