import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // static final SecureStorage _instance = SecureStorage._internal();
  //
  // factory SecureStorage() => _instance;
  //
  // SecureStorage._internal();

  SecureStorage(){
    setup();
  }

  FlutterSecureStorage secureStorage = FlutterSecureStorage();


  String _token="";

  String _refreshToken="";

  String get token{
    print(_token);
    return _token;
  }

  String get refreshToken=>_refreshToken;

  set refreshToken(String refreshToken){
    _refreshToken=refreshToken;
    secureStorage.write(key: "refresh_token", value: _refreshToken);
  }

  set token(String token){
    _token=token;
    secureStorage.write(key: "access_token", value:token);
  }

  String _onBoardingDone="false";

  String get onBoardingDone=>_onBoardingDone;

  set onBoardingDone(String onboardingDone){
    _onBoardingDone=onboardingDone;
    secureStorage.write(key: "onboarding_done", value: onboardingDone);
  }

  void setup()async{
    _token=await secureStorage.read(key: "access_token")??"";
    _refreshToken=await secureStorage.read(key: "access_token")??"";
  }

  static logout(){

  }

}