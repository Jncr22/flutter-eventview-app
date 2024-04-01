import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventview_application_1/presentation/screens.dart';
import 'package:eventview_application_1/presentation/widgets/logo_widget.dart';

class HomeStudentView extends StatefulWidget {
  const HomeStudentView({super.key});

  @override
  _HomeStudentViewState createState() => _HomeStudentViewState();
}

class _HomeStudentViewState extends State<HomeStudentView> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
    if (_user != null) {
      _fetchUserData();
    }
  }

  Future<void> _fetchUserData() async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(_user!.uid).get();
      setState(() {
        _userData = userDoc.data() as Map<String, dynamic>?;
      });
      print('Datos del usuario: $_userData'); // Agrega esta línea para depurar
    } catch (e) {
      print('Error al obtener los datos del usuario: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.centerLeft,
            child: LogoView(),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () => (),
              icon: const Icon(Icons.search),
              iconSize: 40.0,
            )
          ],
        ),
        body: _userData == null
            ? const Center(
                child:
                    CircularProgressIndicator()) // Muestra un indicador de carga mientras se obtienen los datos
            : Stack(
                children: [
                  const IconsButtonDownBar(
                    leftButtonIcon: Icons.settings,
                    rightButtonIcon: Icons.exit_to_app,
                    iconSize: 40.0,
                  ),
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Dentro de tu método build, donde intentas mostrar la imagen de perfil
                          _userData!['profilePicture'] != null
                              ? Image.network(
                                  _userData!['profilePicture'],
                                  width:
                                      250, // Ajusta el tamaño según sea necesario
                                  height:
                                      250, // Ajusta el tamaño según sea necesario
                                  fit: BoxFit.cover,
                                )
                              : const Icon(Icons.account_circle_sharp,
                                  size: 150), // O simplemente no mostrar nada

                          const SizedBox(height: 12.0),
                          TextFieldCustom(
                              readOnly: true,
                              labelText: 'Nombre',
                              hintText: _userData!['name'] ?? 'Nombre',
                              fontSize: 16.0,
                              constraints: const BoxConstraints(
                                  minWidth: 100, maxWidth: 350),
                              keyboardType: TextInputType.emailAddress),
                          const SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(),
                              TextFieldCustom(
                                  readOnly: true,
                                  labelText: 'Matricula',
                                  hintText:
                                      _userData!['matriculaNomina'] ?? '99999',
                                  fontSize: 16.0,
                                  constraints: const BoxConstraints(
                                      minWidth: 100, maxWidth: 120),
                                  keyboardType: TextInputType.number),
                              const SizedBox(width: 80.0, height: 30.0),
                              TextFieldCustom(
                                  readOnly: true,
                                  labelText: 'Grupo',
                                  hintText: _userData!['grupo'] ?? 'TI 91',
                                  fontSize: 16.0,
                                  constraints: const BoxConstraints(
                                      minWidth: 100, maxWidth: 150),
                                  keyboardType: TextInputType.text),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 16.0, width: 6),
                              const Center(
                                child: Text(
                                  'Horas Extrariculares: ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextFieldCustom(
                                  readOnly: true,
                                  labelText: '',
                                  hintText: _userData!['horasExtrariculares'] ??
                                      '250',
                                  fontSize: 16.0,
                                  constraints: const BoxConstraints(
                                      minWidth: 80, maxWidth: 170),
                                  keyboardType: TextInputType.number),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
