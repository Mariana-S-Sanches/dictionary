import 'package:dictionary/main.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/word_load/word_load.dart';
import 'package:dictionary/modules/word_item.dart';
import 'package:dictionary/bloc_cubit/model/word_model.dart';
import 'package:dictionary/utils/components/page_view_tab.dart';

class MainMobile extends StatefulWidget {
  const MainMobile({Key? key, required this.screen}) : super(key: key);

  final Screens screen;

  @override
  // ignore: library_private_types_in_public_api
  _MainMobileState createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile> with TickerProviderStateMixin {
  late TabController controller;
  int tabIndex = 0;

  List<WordsModel> fromAPI = [];

  @override
  void initState() {
    WordLoad().readJsonData_A(context);
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: AnimatedTabBar(
          screen: widget.screen,
          tabsTitle: const ['Word List', 'History', 'Favorites'],
          controller: controller,
          children: [
            const WordItemWidget(),
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
          ],
        ),
      ),
    );
  }
}
