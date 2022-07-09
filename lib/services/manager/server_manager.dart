import 'package:dio/dio.dart';
import 'package:wiet_corp/services/manager/base_server_manager.dart';
import 'package:wiet_corp/utilities/helpers.dart';

class ServerManager<T> implements BaseServerManager {
  var dio = getIt<Dio>();
}
