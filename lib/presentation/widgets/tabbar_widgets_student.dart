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
            Tab(icon: Icon(Icons.campaign),text: 'Noticias',),
            Tab(icon: Icon(Icons.edit_calendar),text: 'Eventos'),
            Tab(icon: Icon(Icons.palette),text: 'Workshop'),
            Tab(icon: Icon(Icons.public),text: 'Mundo'),
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

