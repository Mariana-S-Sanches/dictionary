
import 'package:flutter/material.dart';

class PictureWidget {
  static assetPNG({
    required String assetName,
    BoxFit? fit,
    Color? color,
    double? width,
    double? height,
    AlignmentGeometry? alignment,
  }) {
    return Image.asset(
      assetName,
      width: width,
      color: color,
      height: height,
      fit: fit ?? BoxFit.contain,
      alignment: alignment ?? Alignment.center,
    );
  }
}
