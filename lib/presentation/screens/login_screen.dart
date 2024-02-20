
import 'package:eventview_application_1/presentation/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    GradientBackground(
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

            const SizedBox(height:  20.0), 
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Color del botón
                  foregroundColor: Colors.white,),
                onPressed: () {
                  // Aquí va la lógica de inicio de sesión
                  context.goNamed('google');
                },
                child: const Icon(Icons.send_rounded),
              ),

              const SizedBox(height:  20.0), 
              Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey,
            ),
            const SizedBox(height:  30.0), 
              const TextFieldCustom(
                labelText: 'Nomina/Matricula',
                hintText: 'Matricula',
                fontSize:  16.0,
                 constraints: BoxConstraints(minWidth:  100, maxWidth:  350), // Define restricciones de tamaño
                keyboardType: TextInputType.emailAddress
                ),
                const SizedBox(height:  16.0),           
               const TextFieldCustom(
                labelText: 'Contraseña',
                hintText: 'Contraseña',
                fontSize:  16.0,
                constraints: BoxConstraints(minWidth:  100, maxWidth:  350), // Define restricciones de tamaño
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                ),
                const SizedBox(height:  16.0), 
              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Color del botón
                  foregroundColor: Colors.white,),
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