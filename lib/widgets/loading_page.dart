// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:wiet_corp/utilities/app_colors.dart';

class LoadingPage extends StatelessWidget {
  final Widget body;

  const LoadingPage({
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.2,
          child: body,
        ),
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipOval(
                child: CircleAvatar(
                  backgroundColor: AppColors.mainColor,
                  radius: 45,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Image.asset(
                      "assets/loading_logo.png",
                      height: 300,
                      width: 300,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(0),
                height: 100,
                width: 100,
                child: const CircularProgressIndicator(
                  backgroundColor: AppColors.mainColor,
                  strokeWidth: 4,
                  color: AppColors.mainColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.mainColor,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
