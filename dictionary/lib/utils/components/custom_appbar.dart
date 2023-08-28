import 'package:dictionary/utils/default_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.parentContext}) : super(key: key);
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: DefaultColors.primaryTheme,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
