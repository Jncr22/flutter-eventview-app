import 'package:flutter/material.dart';

class RowElevatedButtonCustom extends StatelessWidget {
  final String label;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final Color iconColor;
  final VoidCallback onPressed;

  const RowElevatedButtonCustom({
    super.key,
    required this.label,
    required this.leadingIcon,
    required this.trailingIcon,
    this.iconColor = Colors.black,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width *  0.8), // Limita el ancho al  80% del ancho de la pantalla
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:  30.0, vertical: 10.0), // Agrega un poco de padding horizontal
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(leadingIcon, color: iconColor),
              Text(label),
              Icon(trailingIcon, color: iconColor),
            ],
          ),
        ),
      ),
    );
  }
}
