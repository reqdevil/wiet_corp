import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wiet_corp/utilities/app_colors.dart';
import 'package:wiet_corp/utilities/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool doesGoBack;

  const CustomAppBar({
    Key? key,
    required this.doesGoBack,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(
        window.viewPadding.top > 0 ? 55.0 : 75.0 - statusBarHeight,
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: !doesGoBack
          ? IconButton(
              iconSize: 25,
              icon: const Icon(
                Icons.menu_rounded,
              ),
              onPressed: () {
                ScaffoldState? scaffoldState =
                    context.findRootAncestorStateOfType<ScaffoldState>();
                scaffoldState!.openDrawer();
              },
            )
          : IconButton(
              iconSize: 20,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
      centerTitle: true,
      toolbarHeight: preferredSize.height,
      title: const SizedBox(
        height: 35,
        child: Image(image: ExactAssetImage('assets/logo.png')),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: AppColors.black,
          gradient: LinearGradient(
            colors: [
              AppColors.mainColor,
              AppColors.menuGradientTop,
              AppColors.menuGradientBottom,
            ],
          ),
        ),
      ),
    );
  }
}
