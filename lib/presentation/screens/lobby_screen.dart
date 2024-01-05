import 'package:eventview_application_1/presentation/screens.dart';
import 'package:flutter/material.dart';

class LobyScreen extends StatefulWidget {
  const LobyScreen ({super.key});

 @override
 _LobyScreen createState() => _LobyScreen();
}

class _LobyScreen extends State<LobyScreen> with SingleTickerProviderStateMixin {
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
  WidgetOptions widgetOptions = WidgetOptions(selectedIndex: _selectedIndex, tabController: _tabController);
  return Scaffold(
    body: Center(
      child: widgetOptions.options.elementAt(_selectedIndex),
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
         BottomNavigationBarItem(
     icon: Icon(Icons.home, color: Colors.black),
     label: 'Home',
     activeIcon: Icon(Icons.home, color: Colors.purple),
   ),
   BottomNavigationBarItem(
     icon: Icon(Icons.business, color: Colors.black),
     label: 'Business',
     activeIcon: Icon(Icons.business, color: Colors.purple),
   ),
   BottomNavigationBarItem(
     icon: Icon(Icons.school, color: Colors.black),
     label: 'School',
     activeIcon: Icon(Icons.school, color: Colors.purple),
   ),
   BottomNavigationBarItem(
     icon: Icon(Icons.settings, color: Colors.black),
     label: 'Settings',
     activeIcon: Icon(Icons.settings, color: Colors.purple),
   ),
   BottomNavigationBarItem(
     icon: Icon(Icons.person, color: Colors.black),
     label: 'Profile',
     activeIcon: Icon(Icons.person, color: Colors.purple),
   ),
      ],
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    ),
  );
 }
}

