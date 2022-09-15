import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/navigation/navigation.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';
import 'package:pet_planet/data/models/category_model.dart';
import 'package:pet_planet/presentation/screens/main/home/widgets/home_category_item.dart';

class HomeCategoryList extends StatelessWidget {
  const HomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: AppSize.s90.w,
          margin: EdgeInsets.symmetric(vertical: AppMargin.m20.h),
          decoration: const BoxDecoration(
            color: ColorManager.primaryColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppSize.s50),
              bottomRight: Radius.circular(AppSize.s50),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 0.06.sh),
          child: ListView.builder(
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  navigateToWithArguments(
                    context,
                    Routes.categoryDetailsRoute,
                    Category.categoriesList[index],
                  );
                },
                child:
                    HomeCategoryItem(categoryModel: Category.categoriesList[index]),
              );
            }),
            itemCount: Category.categoriesList.length,
          ),
        ),
      ],
    );
  }
}
/*
Center( /// EQUAL ListView.builder 😢😴
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ItemModel.list.map((ItemModel data) {
                  return HomeCategoryItem(
                    itemModel: data,
                  );
                }).toList(),
              ),
            ),
          ),
*/