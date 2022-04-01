import 'package:bloc/bloc.dart';
import 'package:blog_app/config/utils/secure_storage.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(Uninitialized()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is AppStarted) {
        var token = await _getToken();
        if (token != '') {
          SecureStorage().token = token;
          emit(Authenticated());
        } else {
          emit(Unauthenticated());
        }
      }

      if (event is LoggedIn) {
        SecureStorage().token = event.token;
        await _saveToken(event.token);
        emit(Authenticated());
      }

      if (event is LoggedOut) {
        SecureStorage().token = '';
        await _deleteToken();
        emit(Unauthenticated());
      }
    });
  }

  /// delete from keystore/keychain
  Future<void> _deleteToken() async {
    await SecureStorage().secureStorage.delete(key: 'access_token');
  }

  /// write to keystore/keychain
  Future<void> _saveToken(String token) async {
    await SecureStorage()
        .secureStorage
        .write(key: 'access_token', value: token);
  }

  /// read to keystore/keychain
  Future<String> _getToken() async {
    return await SecureStorage().secureStorage.read(key: 'access_token') ?? '';
  }
}
