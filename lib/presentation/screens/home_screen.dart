import 'package:flutter/material.dart';

import '../widgets/logo_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: LogoView(fontSize: 24.0,
          ),
          )
        )
      );
  }
}
