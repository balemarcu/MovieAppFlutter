import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  NetworkModule() {
    //_addInterceptors();
  }

  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: 'https://api.themoviedb.org/3',
        ),
      )..interceptors
            .add(InterceptorsWrapper(onRequest: ((options, handler) async {
          return handler.next(options
            ..queryParameters = {
              'api_key': _apiKey,
            });
        })));

  static const String _apiKey = 'eb21f459f41bb6dc060c3faee159b32d';
}
