import 'package:http/http.dart';

class AuthenticationResponse extends BaseResponse {
  String? bearerToken;
  String? refreshToken;

  AuthenticationResponse({
    this.bearerToken,
    this.refreshToken
}) : super(0);

  factory AuthenticationResponse.fromJson(Map<String,dynamic> json){
    return AuthenticationResponse(
      bearerToken: json["token"],
      refreshToken: json["refreshToken"]
    );
  }

  Map<String,dynamic> toJson(AuthenticationResponse response){
    return {
      'bearerToken':response.bearerToken??"",
      'refreshToken':response.refreshToken??""
    };
  }

}