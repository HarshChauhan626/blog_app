
import 'error_handler.dart';

class ApiFailure {
  int code; // 200 or 400
  String message; // error or success

  ApiFailure(this.code, this.message);
}

class DefaultFailure extends ApiFailure {
  DefaultFailure() : super(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
}
