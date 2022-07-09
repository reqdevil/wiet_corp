import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:wiet_corp/services/manager/server_manager.dart';

final getIt = GetIt.instance;

void dissmissKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

showStatusBar() {
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );
}

hideStatusBar() {
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [],
  );
}

void setupGetIt() {
  getIt.registerLazySingleton(() => ServerManager());
  getIt.registerLazySingleton(() => Dio());
}
