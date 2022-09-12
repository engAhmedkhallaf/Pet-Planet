 import 'package:pet_planet/presentation/resources/strings_manager.dart';

String? nameValidator(value) {
    if (value!.isEmpty) {
      return AppStrings.nameCanNotBeEmpty;
    } else if (!RegExp(AppStrings.nameRegularExpression).hasMatch(value)) {
      return AppStrings.enterCorrectName;
    } else {
      return null;
    }
  }

  String? emailValidator(value) {
    if (value!.isEmpty) {
      return AppStrings.emailAddressCanNotBeEmpty;
    } else if (!RegExp(AppStrings.emailAddressRegularExpression)
        .hasMatch(value)) {
      return AppStrings.enterCorrectEmailAddress;
    } else {
      return null;
    }
  }

  String? mobileNumberValidator(value) {
    if (value!.isEmpty) {
      return AppStrings.mobileNumberCanNotBeEmpty;
    } else if (!RegExp(AppStrings.mobileNumberRegularExpression)
        .hasMatch(value)) {
      return AppStrings.enterCorrectMobileNumber;
    } else {
      return null;
    }
  }

  String? addressValidator(value) {
    if (value!.isEmpty) {
      return AppStrings.addressCanNotBeEmpty;
    } else {
      return null;
    }
  }

  String? passwordValidator(value) {
    if (value!.isEmpty) {
      return AppStrings.passwordCanNotBeEmpty;
    } else if (value.length < 8) {
      return AppStrings.passwordCanNotBeLessThan_8Characters;
    } else {
      return null;
    }
  }
