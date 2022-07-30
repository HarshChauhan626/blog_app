class LoginRequest {
  String email;
  String password;
  LoginRequest({required this.email,required this.password});
}

class RegisterRequest {
  
}


class BlogListRequest{
  int currentIndex;
  int listType;

  BlogListRequest({required this.currentIndex,required this.listType});

  Map<String,dynamic> toJson(){
    return {
      "current_index":currentIndex,
      "list_type":listType
    };
  }



}