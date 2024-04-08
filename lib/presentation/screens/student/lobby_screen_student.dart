import 'package:eventview_application_1/presentation/screens.dart';
import 'package:flutter/material.dart';

class LobbyScreenStudent extends StatefulWidget {
  const LobbyScreenStudent ({super.key});

 @override
 _LobbyScreenStudent createState() => _LobbyScreenStudent();
}

class _LobbyScreenStudent extends State<LobbyScreenStudent> with SingleTickerProviderStateMixin {
 int _selectedIndex = 0;
 TabController? _tabController;

 @override
 void initState() {
  super.initState();
  _tabController = TabController(length: 4, vsync: this);
 }

 @override
 void dispose() {
  _tabController?.dispose();
  super.dispose();
 }

 @override
 Widget build(BuildContext context) {
  WidgetOptionsStudent widgetOptions = WidgetOptionsStudent(selectedIndex: _selectedIndex, tabController: _tabController);
  return Scaffold(
   body: Center(
     child: widgetOptions.options.elementAt(_selectedIndex),
   ),
   bottomNavigationBar: Theme(
    data: Theme.of(context).copyWith(
     canvasColor: const Color.fromRGBO(15, 22, 81, 1), // Fondo de la BottomNavigationBar
     primaryColor: Colors.white, // Color del ítem seleccionado
     indicatorColor: Colors.white,
     //textTheme: Theme.of(context).textTheme.copyWith(caption: const TextStyle(color: Colors.white)), // Color de los ítems no seleccionados
    ),
    child: BottomNavigationBar(
      unselectedItemColor: Colors.grey,
     items: const <BottomNavigationBarItem>[
       BottomNavigationBarItem(
         icon: Icon(Icons.home),
         label: 'Home',
         
       ),
       BottomNavigationBarItem(
         icon: Icon(Icons.language),
         label: 'Post',
       ),
       BottomNavigationBarItem(
         icon: Icon(Icons.email),
         label: 'Mensaje',
       ),
     ],
     currentIndex: _selectedIndex,
     onTap: (index) {
        setState(() {
              _selectedIndex = index;
              // Si el ítem seleccionado es el que contiene las pestañas, actualiza el TabController
              if (index ==  0) { // Asumiendo que el ítem  0 es el que contiene las pestañas
                _tabController?.animateTo(index);
              }
      });
     },
   ),
   ),
   );
 }
}
