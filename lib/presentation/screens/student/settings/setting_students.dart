import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventview_application_1/presentation/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingStudent extends StatefulWidget {
  const SettingStudent({super.key});
    @override
  _SettingStudent createState() => _SettingStudent();
}
class _SettingStudent extends State<SettingStudent> {
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
        body: _userData == null
            ? const Center(
                child:
                    CircularProgressIndicator())
        : Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _userData!['profilePicture'] != null
                              ? Image.network(
                                  _userData!['profilePicture'],
                                  width:
                                      250, // Ajusta el tamaño según sea necesario
                                  height:
                                      250, // Ajusta el tamaño según sea necesario
                                  fit: BoxFit.cover,
                                )
                              : const SizedBox
                                  .shrink(),
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
