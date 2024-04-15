import 'package:eventview_application_1/presentation/screens.dart';
import 'package:flutter/material.dart';

class LobyScreen extends StatefulWidget {
  const LobyScreen({super.key});

  @override
  _LobyScreen createState() => _LobyScreen();
}

class _LobyScreen extends State<LobyScreen>
    with SingleTickerProviderStateMixin {
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
    WidgetOptions widgetOptions = WidgetOptions(
        selectedIndex: _selectedIndex, tabController: _tabController);
    return Scaffold(
      body: Center(
        child: widgetOptions.options.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color.fromRGBO(
              15, 22, 81, 1), // Fondo de la BottomNavigationBar
          primaryColor: Colors.white, // Color del ítem seleccionado
          //textTheme: Theme.of(context).textTheme.copyWith(caption: const TextStyle(color: Colors.white)), // Color de los ítems no seleccionados
        ),
        child: BottomNavigationBar(
      unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
              activeIcon: Icon(Icons.home, color: Colors.white),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Mensajes',
              activeIcon: Icon(Icons.mail, color: Colors.white),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.public),
              label: 'Post',
              activeIcon: Icon(Icons.public, color: Colors.white),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.door_front_door),
              label: 'Espacios',
              activeIcon: Icon(Icons.door_front_door, color: Colors.white),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Recursos',
              activeIcon: Icon(Icons.category, color: Colors.white),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
