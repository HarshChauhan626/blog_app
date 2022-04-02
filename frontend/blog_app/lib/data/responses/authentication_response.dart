import 'package:http/http.dart';
import 'package:blog_app/domain/entities/entities.dart';
import 'package:blog_app/config/utils/extensions.dart';

class AuthenticationResponse{
  String? bearerToken;
  String? refreshToken;

  AuthenticationResponse({
    this.bearerToken,
    this.refreshToken
}) : super();

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

  Authentication toDomain(){
    return Authentication(
      bearerToken:this.bearerToken.orEmpty(),refreshToken:this.refreshToken.orEmpty()
    );
  }

}