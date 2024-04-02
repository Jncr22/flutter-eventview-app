import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventview_application_1/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:eventview_application_1/presentation/screens.dart';
import 'package:go_router/go_router.dart';

class SettingAccountView extends StatefulWidget {
  const SettingAccountView({super.key});

  @override
  _SettingAccountViewState createState() => _SettingAccountViewState();
}

class _SettingAccountViewState extends State<SettingAccountView> {
  final TextEditingController _celularController = TextEditingController();

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
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al obtener los datos del usuario: $e')),
        );
      }
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
                  SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16.0),
                          TextFieldCustom(
                            controller: _celularController,
                            labelText: 'Telefono',
                            hintText: _userData!['phone'] ?? 'Lorem ipsum',
                            fontSize: 16.0,
                            keyboardType: TextInputType.number,
                            constraints: const BoxConstraints(
                                minWidth: 100, maxWidth: 350),
                          ),
                          const SizedBox(height: 16.0),
                          const TextFieldCustom(
                            labelText: 'Correo',
                            hintText: 'lorem ipsum',
                            fontSize: 16.0,
                            constraints:
                                BoxConstraints(minWidth: 100, maxWidth: 350),
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () => _updateUserProfile(),
                            child: const Text('Guardar cambios'),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  void _updateUserProfile() {
    Map<String, dynamic> updates = {};

    if (_celularController.text.isNotEmpty) {
      updates['phone'] = _celularController.text;
    }

    if (updates.isNotEmpty) {
      AuthService().updateUserProfile(updates);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('No se encontraron cambios para actualizar.')),
        );
      }
    }
  }
}
