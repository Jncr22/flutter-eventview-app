import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class IconsButtonDownBar extends StatefulWidget {
  final IconData leftButtonIcon;
  final IconData rightButtonIcon;
  final double iconSize;

  const IconsButtonDownBar({
    super.key,
    this.leftButtonIcon = Icons.star, // Icono por defecto para el botón izquierdo
    this.rightButtonIcon = Icons.favorite, // Icono por defecto para el botón derecho
    this.iconSize =  26.0,
  });

  @override
  _IconsButtonDownBar createState() => _IconsButtonDownBar();
}

class _IconsButtonDownBar extends State<IconsButtonDownBar> {
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
                context.goNamed('settings');
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