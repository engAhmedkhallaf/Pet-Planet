import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

class AuthPainter extends StatelessWidget {
  const AuthPainter({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _AuthCustomPainter(),
      child: Image.asset(
        AssetsManager.authBackground,
        alignment: Alignment.topCenter,
        fit: BoxFit.contain,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}

class _AuthCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = ColorManager.primaryColor;
    Path path = Path();

    double maxHeight = AppSize.s330.h;
    double maxWidth = size.width.abs().w;
    double radius = AppSize.s160.w;
    double borderRadius = 15.r;
    double sideOffset = (maxWidth - radius - (AppSize.s4 * borderRadius)) / 2;

    path.moveTo(AppSize.s0, AppSize.s0);
    path.relativeLineTo(AppSize.s0, maxHeight - borderRadius);
    path.relativeQuadraticBezierTo(
      AppSize.s0,
      borderRadius,
      borderRadius,
      borderRadius,
    );
    path.relativeLineTo(sideOffset, AppSize.s0);

    path.relativeQuadraticBezierTo(
      borderRadius - AppSize.s4,
      AppSize.s0,
      borderRadius,
      -borderRadius,
    );
    path.relativeArcToPoint(
      Offset(radius, AppSize.s0),
      radius: Radius.circular(AppSize.s65.r),
    );
    path.relativeQuadraticBezierTo(
      AppSize.s4,
      borderRadius,
      borderRadius,
      borderRadius,
    );
    path.relativeLineTo(sideOffset, AppSize.s0);
    path.relativeQuadraticBezierTo(
      borderRadius,
      AppSize.s0,
      borderRadius,
      -borderRadius,
    );
    path.relativeLineTo(AppSize.s0, -maxHeight);
    path.close();

    canvas.drawShadow(
      path,
      ColorManager.mainColorSwatch.shade100,
      AppSize.s8,
      false,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
