// ignore_for_file: library_private_types_in_public_api

import 'package:dictionary/main.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/utils/components/page_view_tab.dart';

class MainTablet extends StatefulWidget {
  const MainTablet({Key? key, required this.screen}) : super(key: key);

  final Screens screen;
  @override
  _MainTabletState createState() => _MainTabletState();
}

class _MainTabletState extends State<MainTablet> with TickerProviderStateMixin {
  late TabController controller;
  int tabIndex = 0;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: AnimatedTabBar(
          screen: widget.screen,
          tabsTitle: const ['Word List', 'History', 'Favorites'],
          controller: controller,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(color: Colors.red, width: 300, height: 300),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(color: Colors.orange, width: 300, height: 300),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(color: Colors.yellow, width: 300, height: 300),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
