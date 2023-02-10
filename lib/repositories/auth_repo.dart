import 'dart:convert';
import 'package:bloc_final/models/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final Dio dio;
  AuthRepo({
    required this.dio,
  });
  String basicAuth =
      'Basic ${base64Encode(utf8.encode('testEmil12:11223344'))}';

  Future<AuthModel> sendPhone({
    required String phoneNumber,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final response = await dio.get(
      'generateUserId/test?',
      queryParameters: {
        'msisdn': phoneNumber,
      },
      options: Options(
        headers: {
          'authorization': basicAuth,
        },
      ),
    );
    final result = AuthModel.fromJson(response.data);
    await prefs.setString('token', result.object ?? '');
    return result;
  }
}
