import 'package:dio/dio.dart';

class BackendProvider {
  final Dio _dio = Dio();
  final String endpoint = "https://api.fluttertemplate.com/v1";

  BackendProvider();
}
