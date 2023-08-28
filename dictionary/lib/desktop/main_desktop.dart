import 'package:dictionary/main.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/utils/default_colors.dart';

class MainDesktop extends StatefulWidget {
  const MainDesktop({Key? key, required this.screen}) : super(key: key);

  final Screens screen;
  @override
  _MainDesktopState createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawerScrimColor: DefaultColors.black_popup,
      backgroundColor: DefaultColors.background,
      body: Row(
        children: [
          const Column(
            children: [],
          )
        ],
      ),
    );
  }
}
