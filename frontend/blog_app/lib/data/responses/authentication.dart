class AuthenticationResponse{
  String? bearerToken;
  String? refreshToken;

  AuthenticationResponse({
    this.bearerToken,
    this.refreshToken
});

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