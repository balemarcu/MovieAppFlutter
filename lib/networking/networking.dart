import 'package:dio/dio.dart';

class NetworkModule {
  NetworkModule() {
    _addInterceptors();
  }

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
    ),
  );

  static const String _apiKey = 'eb21f459f41bb6dc060c3faee159b32d';

  void _addInterceptors() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      return handler.next(options
        ..queryParameters = {
          'api_key': _apiKey,
        });
    }));
  }
}