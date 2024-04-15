import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoView extends StatelessWidget {
  const LogoView({
    super.key,
    // Tamaño por defecto de la fuente
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210, // Especifica el ancho del contenedor
      height: 120, // Especifica la altura del contenedor
      alignment: Alignment.centerLeft, // Alinea el contenido a la derecha
      child: SvgPicture.asset('assets/svg/logo2.svg'),
    );
  }
}
