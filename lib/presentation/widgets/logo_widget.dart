import 'package:flutter/material.dart';

class LogoView extends StatelessWidget {
 final Color textColor;
 final Color dotColor;
 final double fontSize;

 const LogoView({super.key, 
   this.textColor = Colors.black, // Color por defecto del texto
   this.dotColor = Colors.yellow, // Color por defecto para el punto es amarillo
   this.fontSize = 22.0, // Tamaño por defecto de la fuente
 });

 @override
 Widget build(BuildContext context) {
   return RichText(
     text: TextSpan(
       style: TextStyle(
         fontSize: fontSize,
         color: textColor,
       ),
       children: [
         const TextSpan(
           text: 'eventv',
         ),
         WidgetSpan(
           alignment: PlaceholderAlignment.baseline,
           baseline: TextBaseline.alphabetic,
           child: Stack(
             children: <Widget>[
               Text('i', style: TextStyle(color: textColor, fontSize: fontSize * 0.76)),
               Positioned(
                top: fontSize * 0.25, // Ajusta este valor para mover el punto hacia abajo
                left: fontSize * 0.02, // Ajusta según sea necesario para centrar el punto
                child: Container(
                  width: fontSize * 0.2, // Ajusta el tamaño del punto
                  height: fontSize * 0.2,
                  decoration: BoxDecoration(
                    color: dotColor, // Color para el punto
                    shape: BoxShape.circle,
                  ),
                ),
               ),
             ],
           ),
         ),
         const TextSpan(
           text: 'ew',
         ),
       ],
     ),
   );
 }
}

