import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate/utils/home.dart';

class ApiConstants {
  static String baseUrl = 'https://625f6a2053a42eaa07f4956f.mockapi.io';
  static String homesEndpoint = '/home';
}

class ApiService {
  Future<List<Home>?> getHomes() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.homesEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Home> _home = homeFromJson(response.body);
        return _home;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
