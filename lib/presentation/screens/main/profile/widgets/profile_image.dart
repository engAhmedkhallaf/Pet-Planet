import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

// ignore: must_be_immutable
class ProfileImage extends StatelessWidget {
  ProfileImage({
    super.key,
    required this.photoUrl,
    this.radius_1 = AppSize.s50,
    this.radius_2 = AppSize.s49,
  });
  final String photoUrl;
  double radius_1;
  double radius_2;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius_1.w,
      backgroundColor: ColorManager.lightGrey,
      child: CircleAvatar(
        backgroundColor: ColorManager.grey,
        radius: radius_2.w,
        backgroundImage: NetworkImage(photoUrl),
      ),
    );
  }
}
