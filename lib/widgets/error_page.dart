import 'package:flutter/material.dart';
import 'package:wiet_corp/utilities/app_colors.dart';

class ErrorPage extends StatelessWidget {
  final Widget body;
  final String errorTitle;

  const ErrorPage({
    Key? key,
    required this.body,
    required this.errorTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.2,
          child: body,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipOval(
                child: CircleAvatar(
                  backgroundColor: AppColors.mainColor,
                  radius: 45,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Image.asset(
                      "assets/error_logo.png",
                      height: 300,
                      width: 300,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              errorTitle,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        )
      ],
    );
  }
}
