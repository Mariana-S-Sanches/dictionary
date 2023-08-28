import 'package:dictionary/main.dart';
import 'package:dictionary/utils/default_colors.dart';
import 'package:flutter/material.dart';

import '../text_styles.dart';

class AnimatedTabBar extends StatefulWidget {
  const AnimatedTabBar({
    super.key,
    required this.screen,
    required this.children,
    required this.tabsTitle,
    required this.controller,
  });

  final Screens screen;
  final List<Widget> children;
  final List<String> tabsTitle;
  final TabController controller;

  @override
  State<AnimatedTabBar> createState() => _AnimatedTabBar();
}

class _AnimatedTabBar extends State<AnimatedTabBar> {
  final animationDuration = const Duration(milliseconds: 300);
  final animationCurve = Curves.linear;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      tabIndex = widget.controller.index;
    });
    widget.controller.addListener(() {
      if (widget.controller.indexIsChanging) {
        setState(() {
          tabIndex = widget.controller.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: DefaultColors.background,
          ),
          child: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: widget.tabsTitle.asMap().entries.map((entry) {
                  final i = entry.key;
                  final isActiveTab = i == tabIndex;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => widget.controller.animateTo(i),
                      child: AnimatedSlide(
                        duration: animationDuration,
                        offset: const Offset(0, 0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            AnimatedOpacity(
                              duration: animationDuration,
                              opacity: isActiveTab ? 1 : 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  color: DefaultColors.primaryTheme[300],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                widget.tabsTitle[i],
                                style: isActiveTab ? responsibleConstraints().copyWith(color: Colors.white) : responsibleConstraints(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: widget.controller,
            physics: const NeverScrollableScrollPhysics(),
            children: widget.children,
          ),
        ),
      ],
    );
  }

  TextStyle responsibleConstraints() {
    TextStyle style;
    if (widget.screen == Screens.mobile) {
      style = CustomTextStyles.bodySmall;
    } else {
      style = CustomTextStyles.body;
    }

    return style;
  }
}
