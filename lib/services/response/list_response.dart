import 'dart:convert';
import 'package:dio/dio.dart';

class ListResponse<T> {
  int statusCode;
  List<T>? data;

  ListResponse({
    required this.statusCode,
    required this.data,
  });

  factory ListResponse.fromJSON(
    Response response,
    Function create,
  ) {
    Map<String, dynamic> json = jsonDecode(response.toString());

    return ListResponse<T>(
      statusCode: response.statusCode!,
      data: response.statusCode == 200 ? create(json["breeds"]) : null,
    );
  }
}
