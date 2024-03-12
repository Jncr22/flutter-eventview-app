import 'package:flutter/material.dart';
import 'package:eventview_application_1/presentation/widgets/gradien_bacground.dart';

class SpaceView extends StatelessWidget {
  const SpaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(),
      body: const Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      '¡Nuevas ')),
              Text(
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  'funciones'),
              Text(
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  'próximamente!')
            ],
          ),
        ],
      ),
    ));
  }
}
