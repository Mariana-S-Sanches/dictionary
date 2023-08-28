import 'package:flutter/material.dart';
import 'package:dictionary/utils/default_colors.dart';

class DividerMain extends StatelessWidget {
  const DividerMain({
    Key? key,
    this.height = 1,
    required this.isDashed,
    this.color = DefaultColors.highlight_grey,
    this.dashWidth = 5,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.containerHeight = 5,
  }) : super(key: key);

  final Color color;
  final bool isDashed;

  ///Dashed divider config
  final double height;

  ///Dashed divider config
  final double? dashWidth;

  ///Line divider config
  final double? marginLeft;

  ///Line divider config
  final double? marginRight;

  ///Line divider config
  final double? containerHeight;

  @override
  Widget build(BuildContext context) {
    if (isDashed == true) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          final dashHeight = height;
          final dashCount = (boxWidth / (2 * dashWidth!)).floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            }),
          );
        },
      );
    } else {
      return SizedBox(
        height: containerHeight,
        child: Center(
          child: Container(
            height: containerHeight,
            margin: EdgeInsetsDirectional.only(start: marginLeft!, end: marginRight!),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: color,
                  width: height,
                ), // createBorderSide(context, color: color, width: thickness),
              ),
            ),
          ),
        ),
      );
    }
  }
}
