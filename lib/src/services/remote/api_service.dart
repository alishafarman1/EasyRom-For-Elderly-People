import 'package:dio/dio.dart';
import 'package:easy_rom_prototype/src/services/remote/api_client.dart';

class ApiService {
  ApiClient? _apiClient;

  ApiService() {
    var dio = Dio();
    _apiClient = ApiClient(dio);
  }
}
