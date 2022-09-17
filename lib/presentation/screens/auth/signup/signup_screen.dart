import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pet_planet/core/app/app_constants.dart';
import 'package:pet_planet/core/network/local/cache_helper.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/data/models/user_model.dart';
import 'package:pet_planet/presentation/business_logic/signup_cubit/signup_cubit.dart';
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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: ((context, state) {
        if (state is SignupLoadingState) {
          _isLoading = true;
        } else if (state is SignupSuccessState) {
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
            Routes.homeRoute,
          );
        } else if (state is SignupFailureState) {
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
                          title: AppStrings.signUp,
                          subTitle: AppStrings.addYourDetailsToSignUP,
                          titleTextStyle: null,
                          subTitleTextStyle: null,
                        ),
                        CustomTextFormField(
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_emailFocusNode),
                          textInputAction: TextInputAction.next,
                          focusNode: _nameFocusNode,
                          labelText: AppStrings.name,
                          keyboardType: TextInputType.name,
                          controller: _nameController,
                          validator: nameValidator,
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
                          validator: emailValidator,
                          autofillHints: const [AutofillHints.email],
                        ),
                        SizedBox(
                          height: AppSize.s20.h,
                        ),
                        CustomTextFormField(
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_addressFocusNode),
                          textInputAction: TextInputAction.next,
                          focusNode: _mobileNumberFocusNode,
                          labelText: AppStrings.mobileNumber,
                          keyboardType: TextInputType.phone,
                          controller: _mobileNumberController,
                          validator: mobileNumberValidator,
                          autofillHints: const [
                            AutofillHints.telephoneNumberNational
                          ],
                        ),
                        SizedBox(
                          height: AppSize.s20.h,
                        ),
                        CustomTextFormField(
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passwordFocusNode),
                          textInputAction: TextInputAction.next,
                          focusNode: _addressFocusNode,
                          labelText: AppStrings.address,
                          keyboardType: TextInputType.streetAddress,
                          controller: _addressController,
                          validator: addressValidator,
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
                          validator: passwordValidator,
                          obscureText: _passwordVisiblityOff,
                          suffixIcon: suffix,
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
                        LoginSignupFooter(
                          question: AppStrings.alreadyHavaAnAccount,
                          actionText: AppStrings.login,
                          onTap: () {
                            navigateBack(context);
                            navigateTo(context, Routes.loginRoute);
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _mobileNumberFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _passwordVisiblityOff = true;
  bool _isLoading = false;
  IconData suffix = Icons.visibility_off_outlined;
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

  void _showPassword() {
    setState(() {
      _passwordVisiblityOff = !_passwordVisiblityOff;
      suffix = _passwordVisiblityOff
          ? Icons.visibility_off_outlined
          : Icons.visibility_outlined;
    });
  }

  void _formValidate() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      await BlocProvider.of<SignupCubit>(context).signUp(
        email: _emailController.text.toLowerCase().trim(),
        password: _passwordController.text.trim(),
        userModel: UserModel(
          displayName: _nameController.text,
          email: _emailController.text,
          phoneNumber: _mobileNumberController.text,
          address: _addressController.text,
          photoUrl: AppConstants.noPhotoUrl,
          createdAt: DateTime.now(),
          isEmailVerified: false,
        ),
      );
    }
  }
}
