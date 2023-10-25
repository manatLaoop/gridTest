import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gridtest/src/constant/api.dart';
import 'package:gridtest/src/model/productModel.dart';

class Service {
  Service._internal();

  static final Service _instance = Service._internal();

  factory Service() => _instance;
  static final _dio = Dio();
  // ..interceptors.add(InterceptorsWrapper(
  //   onRequest: (options, handler) {},
  //   onResponse: (e, handler) {},
  //   onError: (e, handler) {},
  // ));

  Future<List<Product>> getData() async {
    print(123);
    final api = Api.urlTest;
    Response response = await _dio.get("$api");

    List<Product> result = productFromJson(jsonEncode(response.data));

    // inspect(result);
    return result;
  }
}
