import 'package:eventview_application_1/auth_service.dart';
import 'package:eventview_application_1/presentation/screens.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:validators/validators.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final categoryNotifier = ValueNotifier<String>('Alumno');
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Crear cuenta',
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
                  const SizedBox(height: 30.0),
                  TextFieldCustom(
                    controller: emailController,
                    labelText: 'Correo',
                    hintText: 'Correo electrónico',
                    fontSize: 16.0,
                    constraints:
                        const BoxConstraints(minWidth: 100, maxWidth: 350),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 30.0),
                  TextFieldCustom(
                    controller: nameController,
                    labelText: 'Nombre',
                    hintText: 'Juan ',
                    fontSize: 16.0,
                    constraints:
                        const BoxConstraints(minWidth: 100, maxWidth: 350),
                  ),
                  const SizedBox(height: 30.0),
                  TextFieldCustom(
                    controller: lastNameController,
                    labelText: 'Apellidos',
                    hintText: 'Herrera Soto',
                    fontSize: 16.0,
                    constraints:
                        const BoxConstraints(minWidth: 100, maxWidth: 350),
                  ),
                  const SizedBox(height: 16.0),
                  ValueListenableBuilder<String>(
                    valueListenable: categoryNotifier,
                    builder: (context, value, child) {
                      return DropdownButton<String>(
                        value: value,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            categoryNotifier.value = newValue;
                          }
                        },
                        items: <String>['Alumno', 'Profesor']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      );
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFieldCustom(
                    controller: passwordController,
                    labelText: 'Contraseña',
                    hintText: 'Contraseña',
                    fontSize: 16.0,
                    constraints:
                        const BoxConstraints(minWidth: 100, maxWidth: 350),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  const SizedBox(height: 16.0),
                  FlutterPwValidator(
                    defaultColor: const Color.fromARGB(255, 0, 0, 0),
                    controller:
                        passwordController, // Utiliza el controller de tu contraseña
                    successColor: const Color.fromARGB(255, 13, 255, 0),
                    minLength: 8,
                    uppercaseCharCount: 1,
                    numericCharCount: 1,
                    specialCharCount: 1,
                    normalCharCount: 1,
                    width: 250,
                    height: 150,
                    onSuccess: () {
                      // Aquí puedes manejar lo que sucede cuando la contraseña es válida
                    },
                    onFail: () {
                      // Aquí puedes manejar lo que sucede cuando la contraseña no es válida
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (isEmail(emailController.text)) {
                        UserCredential? userCredential =
                            await _authService.signUp(
                          emailController.text,
                          passwordController.text,
                          nameController.text,
                          lastNameController.text,
                          categoryNotifier.value,
                        );
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
                            print(
                                'No se pudo obtener la categoría del usuario');
                            // Opcional: Navegar a una pantalla de error o de configuración
                          }
                        }
                      } else {
                        // Mostrar un mensaje de error si el correo electrónico no es válido
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Por favor, ingresa un correo electrónico válido.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: const Text('Registrarse'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
