import 'package:dio/dio.dart';

class SendEmailRepo {
  final Dio dio;
  SendEmailRepo({
    required this.dio,
  });
  Future<void> postSendEmail() async {
    final Response response = await dio.post('/send');
  }
}
