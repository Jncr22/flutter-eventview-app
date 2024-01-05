import 'package:flutter/material.dart';
import 'package:eventview_application_1/presentation/screens.dart';

class WidgetOptions {
 final int selectedIndex;
 final TabController? tabController;

 WidgetOptions({required this.selectedIndex, required this.tabController});

 List<Widget> get options {
  return [
    const HomeScreen(),
    const MensaView(),
    Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
            Tab(icon: Icon(Icons.directions_boat)),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          NewsNotice(), // Replace with your own screen
          EventsView(), // Replace with your own screen
          StoreView(), // Replace with your own screen
          CircleWord(), // Replace with your own screen
        ],
      ),
    ),
    const SpaceView(),
    const ResourceView(),
  ];
 }
}

