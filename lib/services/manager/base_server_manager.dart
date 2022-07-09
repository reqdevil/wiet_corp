import 'package:wiet_corp/services/response/list_response.dart';

abstract class BaseServerManager<T> {
  Future<ListResponse<T>> getData({
    required Map<String, dynamic> params,
    required Function(List<dynamic>) parseFunction,
  });
}
