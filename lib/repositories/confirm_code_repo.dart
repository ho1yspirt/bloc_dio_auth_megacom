// ignore_for_file: unused_import

import 'dart:convert';
import 'package:bloc_final/models/auth_model.dart';
import 'package:bloc_final/models/send_code_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmCodeRepo {
  final Dio dio;
  ConfirmCodeRepo({
    required this.dio,
  });
  String basicAuth =
      'Basic ${base64Encode(utf8.encode('testEmil12:11223344'))}';

  Future<SendCodeModel> sendCode({
    required String code,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final response = await dio.get(
      'checkCode/test?',
      queryParameters: {
        'code': code,
        'uuId': prefs.getString('token'),
      },
      options: Options(
        headers: {
          'authorization': basicAuth,
        },
      ),
    );
    final result = SendCodeModel.fromJson(response.data);
    return result;
  }
}
