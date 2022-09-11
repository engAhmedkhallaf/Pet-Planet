import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';
import 'package:pet_planet/presentation/screens/auth/widgets/custom_text_form_field.dart';
import 'package:pet_planet/presentation/screens/auth/widgets/login_signup_forgot_header.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      appBar: AppBar(
        foregroundColor: ColorManager.primaryColor,
        backgroundColor: ColorManager.backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          padding: const EdgeInsets.only(
            top: AppPadding.p100,
            left: AppPadding.p20,
            right: AppPadding.p20,
          ),
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginSignupForgotHeader(
                    title: AppStrings.resetPassword,
                    desc: AppStrings
                        .pleaseEnterYourEmailToReciveALinkToCreateANewPasswordViaEmail,
                    titleTextStyle: getApplicationTheme()
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: FontSizeManager.s42.sp),
                    descTextStyle: getApplicationTheme()
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: FontSizeManager.s18.sp),
                  ),
                  CustomTextFormField(
                    onEditingComplete: () => _formValidate,
                    textInputAction: TextInputAction.done,
                    focusNode: _emailFocusNode,
                    labelText: AppStrings.email,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: _emailValidator,
                    autofillHints: const [AutofillHints.email],
                  ),
                  SizedBox(
                    height: AppSize.s30.h,
                  ),
                  ElevatedButton(
                    onPressed: _formValidate,
                    child: const Text(
                      AppStrings.send,
                    ),
                  ),
                  const Expanded(child: SizedBox.shrink()),
                ]),
          ),
        ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  void _formValidate() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      print(_emailController.text);
    }

    //TODO: ADD Function of forget Password
  }

  String? _emailValidator(value) {
    if (value!.isEmpty) {
      return AppStrings.emailAddressCanNotBeEmpty;
    } else if (!RegExp(AppStrings.emailAddressRegularExpression)
        .hasMatch(value)) {
      return AppStrings.enterCorrectEmailAddress;
    } else {
      return null;
    }
  }
}
