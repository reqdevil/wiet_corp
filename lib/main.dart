import 'package:flutter/material.dart';
import 'package:wiet_corp/pages/grid_page.dart';
import 'package:wiet_corp/services/router_service.dart';
import 'package:wiet_corp/utilities/helpers.dart';
import 'package:wiet_corp/utilities/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WIET Corp Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouterService.generateRoute,
      initialRoute: HOME_PAGE,
      home: const GridPage(),
    );
  }
}
