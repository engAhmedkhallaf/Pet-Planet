import 'package:flutter/material.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
 final bool obscureText;
 final TextEditingController? controller;
 final TextInputType keyboardType;
 final void Function()? onEditingComplete;
 final void Function()? onTap;
 final void Function()? onSuffixIconButtonPressed;
 final String? Function(String?)? validator;
 final FocusNode focusNode;
 final TextInputAction textInputAction;
 final IconData? suffixIcon;
 final Iterable<String>? autofillHints;
 const CustomTextFormField({
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
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: autofillHints,
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
