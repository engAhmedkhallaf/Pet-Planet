import 'package:flutter/material.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  bool obscureText;
  TextEditingController? controller;
  TextInputType keyboardType;
  void Function()? onEditingComplete;
  void Function()? onTap;
  void Function()? onSuffixIconButtonPressed;
  String? Function(String?)? validator;
  FocusNode focusNode;
  TextInputAction textInputAction;
  IconData? suffixIcon;
  CustomTextFormField({
    super.key,
    required this.labelText,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onTap,
    required this.focusNode,
    required this.textInputAction,
    this.onEditingComplete,
    this.suffixIcon,
    this.onSuffixIconButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      focusNode: focusNode,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: suffixIcon == null
            ? const SizedBox()
            : IconButton(
                onPressed: onSuffixIconButtonPressed,
                icon: Icon(
                  suffixIcon,
                ),
              ),
        // isCollapsed: false,
      ),
      cursorColor: ColorManager.primaryColor,
      onTap: onTap,
    );
  }
}
