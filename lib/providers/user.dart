import 'dart:convert' as convert;
import 'package:client/constants/constants.dart';
import 'package:client/functions/jwt.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

enum LoaderStatus { busy, idle }

class UserProvider with ChangeNotifier {
  //Loader State
  static LoaderStatus _loaderStatus = LoaderStatus.idle;
  LoaderStatus get loaderStatus => _loaderStatus;
  void setLoaderStatus(LoaderStatus status) {
    _loaderStatus = status;
  }

  //Jwtprovider for language
  var jwtProvider = JWTProvider();

  //Daily Data
  List _userDailyData = [];

  List get userDailyData => [..._userDailyData];

  Future<String> updatedailyData() async {
    _userDailyData = [];
    String token = await jwtProvider.token;
    print('$url/userdailydata/');

    var response = await http.get(
      '$url/userdailydata/',
      headers: {
        "Content-type": "application/json",
        "Authorization": "token $token"
      },
    );
    var decodedResponse = convert.jsonDecode(response.body);
    _userDailyData = decodedResponse;
    notifyListeners();
    //Something must be returned for the Future in Profile section
    return 'ok';
  }

  //Only for getting token
  Future<String> loginuser(String number) async {
    var response = await http.post(
      '$url/login/',
      headers: {
        "Content-type": "application/json",
      },
      body: convert.jsonEncode({
        "phone": number,
      }),
    );
    var decodedResponse = convert.jsonDecode(response.body);
    return decodedResponse['key'];
  }
}
