import 'package:injectable/injectable.dart';

@lazySingleton
abstract class ApiService {
  
  Future<dynamic> fetchHomeScreenData();

}
