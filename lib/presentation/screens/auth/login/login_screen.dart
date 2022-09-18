import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pet_planet/core/app/app_constants.dart';
import 'package:pet_planet/core/network/local/cache_helper.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/presentation/business_logic/login_cubit/login_cubit.dart';
import 'package:pet_planet/presentation/common/widgets/custom_loading_indicator.dart';
import 'package:pet_planet/presentation/common/widgets/custom_snack_bar.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/navigation/navigation.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';
import 'package:pet_planet/presentation/screens/auth/widgets/custom_text_form_field.dart';
import 'package:pet_planet/presentation/screens/auth/widgets/login_signup_footer.dart';
import 'package:pet_planet/presentation/screens/auth/widgets/login_signup_forgot_header.dart';
import 'package:pet_planet/presentation/screens/auth/widgets/text_form_field_validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: ((context, state) {
        if (state is LoginLoadingState) {
          _isLoading = true;
        } else if (state is LoginSuccessState) {
          // Save User Uid globaly
          AppConstants.userUid = state.uid;

          // Save User Uid in Cache Helper
          CacheHelper.put(
            key: AppConstants.uidKey,
            value: state.uid,
          );

          _isLoading = false;

          navigateAndRemove(
            context,
            Routes.mainLayoutRoute,
          );
        } else if (state is LoginFailureState) {
          _isLoading = false;

          errorSnackBar(
            context: context,
            message: state.errorMessage,
          );
        }
      }),
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: _isLoading,
          progressIndicator: const CustomLoadingIndicator(),
          child: Scaffold(
            backgroundColor: ColorManager.backgroundColor,
            body: Container(
              padding: const EdgeInsets.only(
                top: AppPadding.p100,
                left: AppPadding.p20,
                right: AppPadding.p20,
              ),
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
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
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passwordFocusNode),
                          textInputAction: TextInputAction.next,
                          focusNode: _emailFocusNode,
                          labelText: AppStrings.yourEmail,
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          validator: emailValidator,
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
                          validator: passwordValidator,
                          obscureText: _passwordVisiblityOff,
                          suffixIcon: _passwordVisiblityOff
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
                            navigateTo(context, Routes.forgotPasswordRoute);
                          },
                          child: const Text(
                            AppStrings.forgotYourPassword,
                          ),
                        ),
                        SizedBox(
                          height: 0.25.sh,
                        ),
                        LoginSignupFooter(
                          question: AppStrings.doNotHavaAnAccount,
                          actionText: AppStrings.signUp,
                          onTap: () {
                            navigateBack(context);
                            navigateTo(
                              context,
                              Routes.signUpRoute,
                            );
                          },
                        ),
                        SizedBox(
                          height: AppSize.s10.h,
                        ),
                      ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _passwordVisiblityOff = true;
  bool _isLoading = false;

  @override
  void initState() {
    _passwordVisiblityOff = true;
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
      await BlocProvider.of<LoginCubit>(context).login(
        email: _emailController.text.toLowerCase().trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  void _showPassword() {
    setState(() {
      _passwordVisiblityOff = !_passwordVisiblityOff;
    });
  }
}
