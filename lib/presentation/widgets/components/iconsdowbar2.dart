import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class IconsButtonDownBar2 extends StatefulWidget {
  final IconData leftButtonIcon;
  final IconData rightButtonIcon;
  final double iconSize;

  const IconsButtonDownBar2({
    super.key,
    this.leftButtonIcon = Icons.star, // Icono por defecto para el botón izquierdo
    this.rightButtonIcon = Icons.favorite, // Icono por defecto para el botón derecho
    this.iconSize =  26.0,
  });

  @override
  _IconsButtonDownBar2 createState() => _IconsButtonDownBar2();
}

class _IconsButtonDownBar2 extends State<IconsButtonDownBar2> {
  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.all(2.0), // Espacio alrededor de los iconos
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right:  6.0), // Espacio a la derecha del primer icono
            child: IconButton(
              icon: Icon(widget.leftButtonIcon, size: widget.iconSize),
              onPressed: () {
                context.goNamed('settingsTeach');
              },
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:  6.0), // Espacio a la izquierda del segundo icono
            child: IconButton(
              icon: Icon(widget.rightButtonIcon, size: widget.iconSize),
              onPressed: () {
                context.goNamed('signIn');
              },
            ),
          ),
        ],
      ),
    );
  }
}