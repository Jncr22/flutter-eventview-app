import 'package:eventview_application_1/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart'; // Asegúrate de que la ruta sea correcta
import 'dart:io';

class CameraTeacherScreen extends StatefulWidget {
  const CameraTeacherScreen({super.key});

  @override
  CameraScreenTeacherState createState() => CameraScreenTeacherState();
}

class CameraScreenTeacherState extends State<CameraTeacherScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    return _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  Future<void> _takePictureAndUpload() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();

      final Directory extDir = await getApplicationDocumentsDirectory();
      final String dirPath = '${extDir.path}/Pictures/flutter_test';
      await Directory(dirPath).create(recursive: true);
      final String filePath = '$dirPath/${timestamp()}.jpg';

      // Copia la imagen al directorio de la aplicación
      await image.saveTo(filePath);

      // Verifica si el contexto sigue siendo válido antes de mostrar el SnackBar
      if (mounted) {
        // Opcional: Muestra un mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Imagen guardada, por favor espere')),
        );
      }

      // Sube la imagen a Firebase Storage
      final ref =
          FirebaseStorage.instance.ref('profile_pictures/${timestamp()}.jpg');
      await ref.putFile(File(filePath));

      // Actualiza la imagen de perfil en Firestore
      await AuthService().updateProfilePicture(File(filePath));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Imagen subida y perfil actualizado con éxito')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar la imagen: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Screen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.goNamed('settingsTeach'), // Navega hacia atrás
        ),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePictureAndUpload,
        child: const Icon(Icons.camera),
      ),
    );
  }
}
