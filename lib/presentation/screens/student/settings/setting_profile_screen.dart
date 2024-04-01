import 'package:eventview_application_1/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:eventview_application_1/presentation/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';

class SettingProfileView extends StatefulWidget {
  const SettingProfileView({super.key});

  @override
  _SettingProfileViewState createState() => _SettingProfileViewState();
}

class _SettingProfileViewState extends State<SettingProfileView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _secondSurnameController = TextEditingController();
  final TextEditingController _matriculaNominaController = TextEditingController();
  final TextEditingController _grupoController = TextEditingController();

  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        setState(() {
          _userData = userDoc.data() as Map<String, dynamic>?;
        });
      }
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
          title: Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Perfil',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  color: Colors.black,
                  onPressed: () {
                    context.goNamed('settings');
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ],
            ),
          ),
        ),
        body: _userData == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16.0),
                        TextFieldCustom(
                          controller: _nameController,
                          labelText: 'Nombre',
                          hintText: _userData!['name'] ?? 'Lorem ipsum',
                          fontSize: 16.0,
                          constraints: const BoxConstraints(
                              minWidth: 100, maxWidth: 350),
                        ),
                        const SizedBox(height: 16.0),
                        TextFieldCustom(
                          controller: _lastNameController,
                          labelText: 'Primer Apellido',
                          hintText: _userData!['lastName'] ?? 'Lorem ipsum',
                          fontSize: 16.0,
                          constraints: const BoxConstraints(
                              minWidth: 100, maxWidth: 350),
                        ),
                        const SizedBox(height: 16.0),
                        TextFieldCustom(
                          controller: _secondSurnameController,
                          labelText: 'Segundo Apellido',
                          hintText:
                              _userData!['secondName'] ?? 'Lorem ipsum',
                          fontSize: 16.0,
                          constraints: const BoxConstraints(
                              minWidth: 100, maxWidth: 350),
                        ),
                        const SizedBox(height: 16.0),
                        TextFieldCustom(
                          controller: _matriculaNominaController,
                          labelText: 'Matricula/Nomina',
                          hintText:
                              _userData!['matriculaNomina'] ?? 'Lorem ipsum',
                          fontSize: 16.0,
                          constraints: const BoxConstraints(
                              minWidth: 100, maxWidth: 350),
                        ),
                        const SizedBox(height: 16.0),
                        TextFieldCustom(
                          controller: _grupoController,
                          labelText: 'Grupo',
                          hintText: _userData!['grupo'] ?? 'Lorem ipsum',
                          fontSize: 16.0,
                          constraints: const BoxConstraints(
                              minWidth: 100, maxWidth: 350),
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () => _updateUserProfile(),
                          child: const Text('Guardar cambios'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }

  void _updateUserProfile() {
    Map<String, dynamic> updates = {};

    if (_nameController.text.isNotEmpty) {
      updates['name'] = _nameController.text;
    }
    if (_lastNameController.text.isNotEmpty) {
      updates['lastName'] = _lastNameController.text;
    }
    if (_secondSurnameController.text.isNotEmpty) {
      updates['secondName'] = _secondSurnameController.text;
    }
    if (_matriculaNominaController.text.isNotEmpty) {
      updates['matriculaNomina'] = _matriculaNominaController.text;
    }
    if (_grupoController.text.isNotEmpty) {
      updates['grupo'] = _grupoController.text;
    }

    if (updates.isNotEmpty) {
      AuthService().updateUserProfile(updates);
    } else {
      print('No se encontraron cambios para actualizar.');
    }
  }
}
