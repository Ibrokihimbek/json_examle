import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:json_example/data/models/user_data.dart';

class ApiService {
  List UsersData = [];
  Future<void> getAllCards() async {
    String data =
        rootBundle.loadString('assets/josn_data/1-002-0001.json') as String;
    var jsonData = jsonDecode(data);
    
    return UsersData.addAll(jsonData);
  }
}
