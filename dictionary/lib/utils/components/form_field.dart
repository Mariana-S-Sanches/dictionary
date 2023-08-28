// ignore: must_be_immutable
import 'package:dictionary/utils/default_colors.dart';
import 'package:dictionary/utils/text_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFields extends StatelessWidget {
  int? maxLength;
  Widget? suffixIcon;
  void Function()? onPressedSuffixIcon;

  String? hintText;
  final String labelText;
  final void Function()? onTap;

  final void Function(String)? onChanged;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  TextInputType? _keyboard;

  final TextStyle? textStyle;
  final InputDecoration? inputDecoration;
  final AutovalidateMode? autoValidateMode;

  final Key? textFieldKey;
  final FocusNode? focusNode;

  final bool clearButton;
  final bool isAmex;
  final bool autoFocus;
  final bool autocorrect;
  final bool enableSuggestions;
  final int? maxLines;
  final bool? enabled;

  CustomTextFields({
    Key? key,
    this.onTap,
    this.hintText,
    this.maxLines,
    this.onChanged,
    this.validator,
    this.maxLength,
    this.textStyle,
    this.focusNode,
    this.suffixIcon,
    this.textFieldKey,
    this.isAmex = false,
    this.inputDecoration,
    this.autoValidateMode,
    this.autoFocus = false,
    this.autocorrect = true,
    this.clearButton = false,
    this.onPressedSuffixIcon,
    this.enableSuggestions = true,
    this.enabled,
    required this.labelText,
    required this.controller,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primarySwatch: DefaultColors.primaryTheme),
      child: TextFormField(
        maxLines: maxLines,
        key: textFieldKey,
        onTap: onTap,
        cursorColor: DefaultColors.primaryTheme,
        onChanged: onChanged ?? (_) {},
        maxLength: maxLength ?? 50,
        controller: controller,
        autovalidateMode: autoValidateMode ?? AutovalidateMode.onUserInteraction,
        validator: validator ?? (_) => null,
        keyboardType: _keyboard,
        style: CustomTextStyles.label,
        focusNode: focusNode,
        autofocus: autoFocus,
        autocorrect: autocorrect,
        enableSuggestions: enableSuggestions,
        decoration: inputDecoration ??
            InputDecoration(
              enabled: enabled ?? true,
              counterText: '',
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintText: labelText,
              labelStyle: CustomTextStyles.label,
            ),
      ),
    );
  }
}
