import 'package:eventview_application_1/presentation/screens.dart';
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
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height:  30.0), 
                const TextFieldCustom(
                  labelText: 'Nombre',
                  hintText: 'Nombre',
                  fontSize:  16.0,
                   constraints: BoxConstraints(minWidth:  100, maxWidth:  350), // Define restricciones de tamaño
                  keyboardType: TextInputType.text
                  ),
                 const SizedBox(height:  30.0), 
                const TextFieldCustom(
                  labelText: 'Apellido',
                  hintText: 'Primer Apellido',
                  fontSize:  16.0,
                   constraints: BoxConstraints(minWidth:  100, maxWidth:  350), // Define restricciones de tamaño
                  keyboardType: TextInputType.text
                  ),
                 const SizedBox(height:  30.0), 
                const TextFieldCustom(
                  labelText: 'Apellidos',
                  hintText: 'Segundo Apellido',
                  fontSize:  16.0,
                   constraints: BoxConstraints(minWidth:  100, maxWidth:  350), // Define restricciones de tamaño
                  keyboardType: TextInputType.text
                  ),
                 const SizedBox(height:  30.0), 
                const TextFieldCustom(
                  labelText: 'Nomina/Matricula',
                  hintText: 'Matricula',
                  fontSize:  16.0,
                   constraints: BoxConstraints(minWidth:  100, maxWidth:  350), // Define restricciones de tamaño
                  keyboardType: TextInputType.number
                  ),
                 const SizedBox(height:  30.0), 
                const TextFieldCustom(
                  labelText: 'Categoria',
                  hintText: 'Elige una opcion',
                  fontSize:  16.0,
                   constraints: BoxConstraints(minWidth:  100, maxWidth:  350), // Define restricciones de tamaño
                  keyboardType: TextInputType.emailAddress
                  ),
                   const SizedBox(height:  30.0), 
                const TextFieldCustom(
                  labelText: 'Telefono',
                  hintText: 'Telefono',
                  fontSize:  16.0,
                   constraints: BoxConstraints(minWidth:  100, maxWidth:  350), // Define restricciones de tamaño
                  keyboardType: TextInputType.number
                  ),
                   const SizedBox(height:  30.0), 
                const TextFieldCustom(
                  labelText: 'Correo',
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
                 const TextFieldCustom(
                  labelText: 'Contraseña',
                  hintText: 'Contraseña',
                  fontSize:  16.0,
                  constraints: BoxConstraints(minWidth:  100, maxWidth:  350), // Define restricciones de tamaño
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  ),
                ElevatedButton(
                  onPressed: () {
                    // Aquí va la lógica de registro
                    context.goNamed('lobby');
                    //Navigator.pushReplacementNamed(context, '/home');
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
