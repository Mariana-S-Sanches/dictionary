// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:dictionary/utils/text_styles.dart';

class ScrollBarLetters extends StatefulWidget {
  const ScrollBarLetters({Key? key, required this.controller, required this.position}) : super(key: key);

  final ScrollController controller;
  final double position;

  @override
  _ScrollBarLettersState createState() => _ScrollBarLettersState();
}

class _ScrollBarLettersState extends State<ScrollBarLetters> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            await widget.controller.animateTo(widget.position, duration: const Duration(seconds: 1), curve: Curves.linear);
            setState(() {});
          },
          child: Text(
            'A',
            style: CustomTextStyles.body,
          ),
        ),
        GestureDetector(
          onTap: () async {
            await widget.controller.animateTo(widget.position, duration: const Duration(seconds: 1), curve: Curves.linear);
          },
          child: Text(
            'B',
            style: CustomTextStyles.body,
          ),
        ),
      ],
    );
  }
}

class GetBoxOffse extends StatefulWidget {
  final Widget child;
  final Function(Offset offset) offset;

  const GetBoxOffse({Key? key, required this.child, required this.offset}) : super(key: key);

  @override
  _GetBoxOffseState createState() => _GetBoxOffseState();
}

class _GetBoxOffseState extends State<GetBoxOffse> {
  GlobalKey widgetKey = GlobalKey();

  Offset offset = const Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final box = widgetKey.currentContext!.findRenderObject() as RenderBox;
      offset = box.localToGlobal(Offset.zero);
      widget.offset(offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }
}
