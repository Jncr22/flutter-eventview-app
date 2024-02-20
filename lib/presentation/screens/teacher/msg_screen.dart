import 'package:eventview_application_1/presentation/widgets/gradien_bacground.dart';
import 'package:flutter/material.dart';

class MensaView extends StatelessWidget {
  const MensaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GradientBackground(child: Center(child: Text('mensaje'),));
  }
}