import 'package:eventview_application_1/presentation/screens.dart';
import 'package:flutter/material.dart';



class SettingSecureView extends StatelessWidget {
  const SettingSecureView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height:  16.0),
                TextFieldCustom(labelText: 'Contraseña')
              ],
            )
          ],
        ),
      ),
    );
  }
}