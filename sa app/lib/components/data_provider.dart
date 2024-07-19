import 'package:flutter/material.dart';
import 'package:sa_app/api/api_services.dart';

import '../models/data_model.dart';


class DataProvider with ChangeNotifier {
  List<DataModel> _dataList = [];
  bool _isLoading = true;

  List<DataModel> get dataList => _dataList;
  bool get isLoading => _isLoading;

  ApiServices apiService = ApiServices();

  // DataProvider() {
  //   fetchData();
  // }

  // void fetchData() async {
  //   _isLoading = true;
  //   notifyListeners();
  //
  //   _dataList = await apiService.fetchData();
  //   _isLoading = false;
  //   notifyListeners();
  // }
}
