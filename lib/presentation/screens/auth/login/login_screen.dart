import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/navigation/navigation.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';
import 'package:pet_planet/presentation/screens/auth/widgets/custom_text_form_field.dart';
import 'package:pet_planet/presentation/screens/auth/widgets/login_signup_footer.dart';
import 'package:pet_planet/presentation/screens/auth/widgets/login_signup_forgot_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
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
                  const LoginSignupForgotHeader(
                    title: AppStrings.login,
                    subTitle: AppStrings.addYourDetailsToLogin,
                    titleTextStyle: null,
                    subTitleTextStyle: null,
                  ),
                  CustomTextFormField(
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
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
                      AppStrings.login,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      navigatorTo(context, Routes.forgotPasswordRoute);
                    },
                    child: const Text(
                      AppStrings.forgotYourPassword,
                    ),
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  LoginSignupFooter(
                    question: AppStrings.doNotHavaAnAccount,
                    actionText: AppStrings.signUp,
                    onTap: () {
                      navigateBack(context);
                    },
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

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _passwordVisible = true;

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _formValidate() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      print(_emailController.text);
      print(_passwordController.text);
    }

    //TODO: ADD Function of Login
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
