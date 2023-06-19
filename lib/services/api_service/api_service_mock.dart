import 'package:injectable/injectable.dart';
import 'package:starter_template_app_new1/services/api_service/api_service.dart';

@lazySingleton
class ApiServiceMock implements ApiService {
  @override
  Future<dynamic> fetchHomeScreenData() {
    // TODO: implement fetchHomeScreenData
    throw UnimplementedError();
  }

}