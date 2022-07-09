// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:wiet_corp/services/manager/base_server_manager.dart';
import 'package:wiet_corp/services/response/list_response.dart';
import 'package:wiet_corp/utilities/helpers.dart';

class ServerManager<T> implements BaseServerManager {
  var dio = getIt<Dio>();

  var BASE_URL =
      "https://api.thecatapi.com/v1/images/search?limit=80&mime_types=&order=Random&size=small&page=3&sub_id=demo-ce06ee";

  @override
  Future<ListResponse<T>> getData({
    required Function(List<dynamic>) parseFunction,
  }) async {
    try {
      final response = await dio.get(
        BASE_URL,
      );

      final data = ListResponse<T>.fromJSON(response, parseFunction);

      return data;
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }
}
