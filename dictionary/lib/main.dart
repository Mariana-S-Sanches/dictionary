// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dictionary/mobile/main_mobile.dart';
import 'package:dictionary/tablet/main_tablet.dart';
import 'bloc_cubit/presenter/cubit/words_cubit.dart';
import 'package:dictionary/desktop/main_desktop.dart';
import 'bloc_cubit/external/get_words_datasource.dart';

void main() {
  runApp(const MyApp());
}

enum Screens {
  mobile,
  tablet,
  desktop,
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictionary',
      debugShowCheckedModeBanner: false,
      home: BlocProvider<WordsMethodsCubit>(
        create: (context) => WordsMethodsCubit(doGetWordsUseCase: WordApiRequest()),
        child: const Responsible(
          mobile: MainMobile(screen: Screens.mobile),
          tablet: MainTablet(screen: Screens.tablet),
          desktop: MainDesktop(screen: Screens.desktop),
        ),
      ),
    );
  }
}

class Responsible extends StatelessWidget {
  const Responsible({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return mobile;
        } else if (constraints.maxWidth < 1100) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
