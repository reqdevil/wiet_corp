import 'package:flutter/material.dart';
import 'package:wiet_corp/pages/grid_page.dart';
import 'package:wiet_corp/pages/information_page.dart';
import 'package:wiet_corp/utilities/routes.dart';

class RouterService {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_PAGE:
        return MaterialPageRoute(
          builder: (_) => const GridPage(),
        );
      case INFORMATION_PAGE:
        return MaterialPageRoute(
          builder: (_) => const InformationPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text("Something went wrong."),
            ),
          ),
        );
    }
  }
}
