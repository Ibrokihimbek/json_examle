import 'package:json_example/data/json/api_service.dart';
import 'package:json_example/data/models/my_response.dart';
import 'package:json_example/data/models/user_data.dart';

class AppRepository {
  late ApiService _apiService;

  AppRepository({required ApiService apiService}) {
    _apiService = apiService;
  }

  Future<void> getCards() => _apiService.getAllCards();

}