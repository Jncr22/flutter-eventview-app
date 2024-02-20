import 'package:flutter/material.dart';

const colorList = <Color>[
 Color.fromRGBO(15, 22, 81, 1),
 Color.fromRGBO(255, 189, 89, 1),
 Color.fromRGBO(240, 221, 154, 1),
 Color.fromRGBO(152, 160, 245, 1)
];

class AppTheme {
 final int selectedColor;

 AppTheme({this.selectedColor = 0})
     : assert(selectedColor >= 0, 'selected color must be greater then 0'),
       assert(selectedColor < colorList.length, 'selected color must be less or equal than ${colorList.length - 1 }');

 ThemeData getTheme() => ThemeData(
   useMaterial3: true,
   colorSchemeSeed: colorList[selectedColor],
   appBarTheme: const AppBarTheme(
     backgroundColor: Color.fromRGBO(15, 22, 81, 1), // Fondo de la AppBar
     titleTextStyle: TextStyle(color: Colors.white), // Color del título de la AppBar
     iconTheme: IconThemeData(color: Colors.white), // Color de los iconos de la AppBar
   ),
   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
     backgroundColor: Color.fromRGBO(15, 22, 81, 1), // Fondo de la BottomNavigationBar
     selectedItemColor: Colors.white, // Color del ítem seleccionado
     unselectedItemColor: Colors.black, // Color de los ítems no seleccionados
   ),
 ); 
}

const linearGradient = LinearGradient(
  colors: [Color(0xffffbd59), Color(0xfff0dd9a)],
  stops: [0.2,  0.5],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);