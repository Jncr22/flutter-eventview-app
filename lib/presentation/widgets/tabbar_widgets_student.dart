import 'package:eventview_application_1/presentation/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:eventview_application_1/presentation/screens.dart';

class WidgetOptionsStudent {
 final int selectedIndex;
 final TabController? tabController;

 WidgetOptionsStudent({required this.selectedIndex, required this.tabController});

 List<Widget> get options {
  return [
    const HomeStudentView(),
    Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: LogoView(fontSize: 24.0,
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(icon: Icon(Icons.directions_car),text: 'Eventos',),
            Tab(icon: Icon(Icons.directions_transit),text: 'Eventos'),
            Tab(icon: Icon(Icons.directions_bike),text: 'Eventos'),
            Tab(icon: Icon(Icons.directions_boat),text: 'Eventos'),
          ],indicatorColor: Colors.white,labelColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          NewsViewStudent(), 
          EvenViewStudent(),
          WordShopViewStudent(), 
          WordViewStudent(), 
        ],
      ),
    ),
    const MensaViewStudent(),
  ];
 }
}

