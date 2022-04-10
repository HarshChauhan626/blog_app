import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final SecureStorage _instance = SecureStorage._internal();

  factory SecureStorage() => _instance;

  SecureStorage._internal();

  FlutterSecureStorage secureStorage = FlutterSecureStorage();


  String _token="";

  String get token=>_token;

  set token(String token){
    _token=token;
    secureStorage.write(key: "access_token", value:token);
  }

  String _onboardingDone="false";

  String get onboardingDone=>_onboardingDone;

  set onboardingDone(String onboardingDone){
    _onboardingDone=onboardingDone;
    secureStorage.write(key: "onboarding_done", value: onboardingDone);
  }

}