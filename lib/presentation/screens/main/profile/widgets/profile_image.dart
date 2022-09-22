import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

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
        backgroundImage: CachedNetworkImageProvider(photoUrl),
        // child: CachedNetworkImage(
        //   imageUrl: photoUrl,
        //   placeholder: (context, url) =>
        //       const Center(child: CircularProgressIndicator()),
        //   errorWidget: (context, url, error) => Image.asset(
        //     AssetsManager.noImage,
        //     fit: BoxFit.cover,
        //   ),
        //   color: ColorManager.lightGrey,
        //   fit: BoxFit.cover,
        //   width: radius_2.r,
        //   height: radius_2.r,
        // ),
      ),
    );
  }
}
