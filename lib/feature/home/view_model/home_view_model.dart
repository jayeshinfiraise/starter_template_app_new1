

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_template_app_new1/core/clients/network/network_client.dart';
import 'package:starter_template_app_new1/injection.dart';
import 'package:starter_template_app_new1/services/api_service/api_service.dart';

class HomeNotifier extends ChangeNotifier {
  static final provider = ChangeNotifierProvider<HomeNotifier>((ref) {
    return HomeNotifier();
  });
  
  final _networkClient = getIt<NetworkClient>();
  final _apiService = getIt<ApiService>();
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }


  final _arrPizzas = <String>[];
  List<String> get arrPizzas => _arrPizzas;
  void addIntoArrPizzas(List<String> newValues) {
    _arrPizzas.addAll(newValues);
    notifyListeners();
  }
  void clearArrPizzas() {
    _arrPizzas.clear();
    notifyListeners();
  }
  

 void getHomeScreenData(){
    //_networkClient.get('${ApiConstants.baseUrl}/posts').then((response) async { 
    _apiService.fetchHomeScreenData().then((response) async {
    isLoading = false;

      if(response.statusCode == 200)
      {
        // final responseData = await response.stream.bytesToString();
        // final value = json.decode('$responseData');
        // final data = value;
       
         final data = response.data;
        // final data = value['data'];
        if(data != null && data is List){
          clearArrPizzas();
           final newItems = <String>[];
          for (final element in data) {
            newItems.add('${element['title']}');
           }
          addIntoArrPizzas(newItems);
        }
      }
      else
      {
        //showToastMessage("Something went wrong !! Please Try Again later");
      }
      
    });
  }
}