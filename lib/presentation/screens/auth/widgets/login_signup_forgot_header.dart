import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

class LoginSignupForgotHeader extends StatelessWidget {
  const LoginSignupForgotHeader({
    super.key,
    required this.title,
    required this.subTitle,
    required this.titleTextStyle,
    required this.subTitleTextStyle,
  });

  final String title;
  final String subTitle;
  final TextStyle? titleTextStyle;
  final TextStyle? subTitleTextStyle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: titleTextStyle ?? getApplicationTheme().textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
        Text(
          subTitle,
          style: subTitleTextStyle ??
              getApplicationTheme().textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: AppSize.s30.h,
        ),
      ],
    );
  }
}
