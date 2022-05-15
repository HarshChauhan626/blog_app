import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference{

  SharedPreferences? sharedPreferences;

  SharedPreference(){
    initPref();
  }

  void initPref()async{
    sharedPreferences=await SharedPreferences.getInstance();
    setUpData();
  }


  bool _onboardingDone=false;

  bool get onboardingDone=>_onboardingDone;

  set onboardingDone(bool onboardingDone){
    _onboardingDone=onboardingDone;
    sharedPreferences?.setBool("onboarding_done",onboardingDone);
  }

  void setUpData(){
    _onboardingDone=sharedPreferences?.getBool("onboarding_done")??false;
  }



}