import 'package:flutter/material.dart';
import 'package:eventview_application_1/presentation/screens.dart';

class CircleWord extends StatelessWidget {
  const CircleWord({super.key});

  @override
  Widget build(BuildContext context) {
    return const GradientBackground(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
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
