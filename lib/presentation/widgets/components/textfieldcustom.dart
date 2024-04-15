import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final double? fontSize;
  final Color? textColor;
  final Color? backgroundColor;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final BoxConstraints? constraints;
  final bool obscureText;
  final TextEditingController? controller;
  final bool readOnly;

  const TextFieldCustom({
    super.key,
    required this.labelText,
    this.hintText,
    this.fontSize,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.decoration,
    this.keyboardType,
    this.constraints,
    this.obscureText = false,
    this.controller,
    this.readOnly = false,
  }) : assert(textColor != null && backgroundColor != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start, // Alinea los elementos a la izquierda
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: Colors.black, // Puedes personalizar el estilo del label
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4.0), // Espacio entre el label y el campo de texto
        ConstrainedBox(constraints: constraints ?? const BoxConstraints(),
          child: TextField(
            textAlign: TextAlign.center,
            controller: controller,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
            ),
            decoration: decoration ??
                InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.blue),
                  fillColor: backgroundColor,
                  filled: true,
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
            keyboardType: keyboardType ?? TextInputType.text,
            obscureText: obscureText,
            readOnly: readOnly, // Asegúrate de que el texto esté oculto
          ),
        ),
      ],
    );
  }
}
