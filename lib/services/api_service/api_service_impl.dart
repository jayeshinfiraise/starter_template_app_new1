import 'package:injectable/injectable.dart';
import 'package:starter_template_app_new1/app/constants/api_constants.dart';
import 'package:starter_template_app_new1/core/clients/network/network_client.dart';
import 'package:starter_template_app_new1/injection.dart';
import 'package:starter_template_app_new1/services/api_service/api_service.dart';

@lazySingleton
class ApiServiceImpl implements ApiService {
  final NetworkClient _apiClient = getIt<NetworkClient>();
  final String _baseUrl = ApiConstants.baseUrl;
 
  @override
  Future<dynamic> fetchHomeScreenData() async {
     final urlPath = '$_baseUrl/posts';
    final response = await _apiClient.get(
      urlPath,
    );
 
    return response;
  }
}