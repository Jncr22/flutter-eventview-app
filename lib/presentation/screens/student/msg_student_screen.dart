import 'package:eventview_application_1/presentation/screens.dart';
import 'package:flutter/material.dart';

import '../../widgets/logo_widget.dart';

class MensaViewStudent extends StatelessWidget {
  const MensaViewStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar( 
        title: const Align(
          alignment: Alignment.centerLeft,
          child: LogoView(),
        ),actions: <Widget>[
            IconButton(onPressed: () => (), icon: const Icon(Icons.search),iconSize: 40.0,)
          ],),
      body: const Stack(
        children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text(
                style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20),
                '¡Nuevas ')
                ),
                Text(
                style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20),
                'funciones'),
                Text(
                style: TextStyle(color: Colors.black,
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