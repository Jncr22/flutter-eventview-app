import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:go_router/go_router.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
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
    // Limpia los recursos de la cámara
    _controller.dispose();
    super.dispose();
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              // Limpia los recursos de la cámara y navega de vuelta
              _controller.dispose();
              context.goNamed('settings');
            },
          ),
        ],
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
        child: const Icon(Icons.camera),
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final image = await _controller.takePicture();
            // Guarda la imagen en el dispositivo
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
                SnackBar(content: Text('Imagen guardada en $filePath')),
              );
            }
          } catch (e) {
            print(e);
            // Verifica si el contexto sigue siendo válido antes de mostrar el SnackBar
            if (mounted) {
              // Opcional: Muestra un mensaje de error
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error al guardar la imagen: $e')),
              );
            }
          }
        },
      ),
    );
  }
}
