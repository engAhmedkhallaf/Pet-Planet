import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/navigation/navigation.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';
import 'package:pet_planet/presentation/screens/auth/widgets/custom_text_form_field.dart';
import 'package:pet_planet/presentation/screens/auth/widgets/login_signup_forgot_header.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: Container(
        padding: const EdgeInsets.only(
          top: AppPadding.p100,
          left: AppPadding.p20,
          right: AppPadding.p20,
        ),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoginSignupForgotHeader(
                    title: AppStrings.signUp,
                    desc: AppStrings.addYourDetailsToSignUP,
                    titleTextStyle: null,
                    descTextStyle: null,
                  ),
                  CustomTextFormField(
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_emailFocusNode),
                    textInputAction: TextInputAction.next,
                    focusNode: _nameFocusNode,
                    labelText: AppStrings.name,
                    keyboardType: TextInputType.name,
                    controller: _nameController,
                    validator: _nameValidator,
                    autofillHints: const [AutofillHints.name],
                  ),
                  SizedBox(
                    height: AppSize.s20.h,
                  ),
                  CustomTextFormField(
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(_mobileNumberFocusNode),
                    textInputAction: TextInputAction.next,
                    focusNode: _emailFocusNode,
                    labelText: AppStrings.yourEmail,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: _emailValidator,
                    autofillHints: const [AutofillHints.email],
                  ),
                  SizedBox(
                    height: AppSize.s20.h,
                  ),
                  CustomTextFormField(
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_addressFocusNode),
                    textInputAction: TextInputAction.next,
                    focusNode: _mobileNumberFocusNode,
                    labelText: AppStrings.mobileNumber,
                    keyboardType: TextInputType.phone,
                    controller: _mobileNumberController,
                    validator: _mobileNumberValidator,
                    autofillHints: const [
                      AutofillHints.telephoneNumberNational
                    ],
                  ),
                  SizedBox(
                    height: AppSize.s20.h,
                  ),
                  CustomTextFormField(
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                    textInputAction: TextInputAction.next,
                    focusNode: _addressFocusNode,
                    labelText: AppStrings.address,
                    keyboardType: TextInputType.streetAddress,
                    controller: _addressController,
                    validator: _addressValidator,
                    autofillHints: const [AutofillHints.addressCity],
                  ),
                  SizedBox(
                    height: AppSize.s20.h,
                  ),
                  CustomTextFormField(
                    onEditingComplete: _formValidate,
                    textInputAction: TextInputAction.done,
                    focusNode: _passwordFocusNode,
                    labelText: AppStrings.password,
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    validator: _passwordValidator,
                    obscureText: _passwordVisible,
                    suffixIcon: _passwordVisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    onSuffixIconButtonPressed: _showPassword,
                    autofillHints: const [AutofillHints.password],
                  ),
                  SizedBox(
                    height: AppSize.s30.h,
                  ),
                  ElevatedButton(
                    onPressed: _formValidate,
                    child: const Text(
                      AppStrings.signUp,
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s18.h,
                  ),
                  Text.rich(
                    TextSpan(
                      text: AppStrings.alreadyHavaAnAccount,
                      style: getApplicationTheme().textTheme.bodyLarge,
                      children: [
                        TextSpan(
                          text: ' ${AppStrings.login}',
                          style: TextStyle(
                            color: ColorManager.primaryColor,
                            fontSize: AppSize.s18.sp,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              navigateBack(context);
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s10.h,
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _mobileNumberFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _passwordVisible = true;

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileNumberController.dispose();
    _addressController.dispose();
    _passwordController.dispose();

    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _mobileNumberFocusNode.dispose();
    _addressFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _formValidate() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      print(_nameController.text);
      print(_emailController.text);
      print(_mobileNumberController.text);
      print(_addressController.text);
      print(_passwordController.text);
    }

    //TODO: ADD Function of Login
  }

  String? _nameValidator(value) {
    if (value!.isEmpty) {
      return AppStrings.nameCanNotBeEmpty;
    } else if (!RegExp(AppStrings.nameRegularExpression).hasMatch(value)) {
      return AppStrings.enterCorrectName;
    } else {
      return null;
    }
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

  String? _mobileNumberValidator(value) {
    if (value!.isEmpty) {
      return AppStrings.mobileNumberCanNotBeEmpty;
    } else if (!RegExp(AppStrings.mobileNumberRegularExpression)
        .hasMatch(value)) {
      return AppStrings.enterCorrectMobileNumber;
    } else {
      return null;
    }
  }

  String? _addressValidator(value) {
    if (value!.isEmpty) {
      return AppStrings.addressCanNotBeEmpty;
    } else {
      return null;
    }
  }

  String? _passwordValidator(value) {
    if (value!.isEmpty) {
      return AppStrings.passwordCanNotBeEmpty;
    } else if (value.length < 8) {
      return AppStrings.passwordCanNotBeLessThan_8Characters;
    } else {
      return null;
    }
  }

  void _showPassword() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
    print(_passwordVisible);
  }
}
