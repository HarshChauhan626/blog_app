import 'package:bloc/bloc.dart';
import 'package:blog_app/domain/repositories/user_repository.dart';
import 'package:blog_app/presentation/features/authentication/authentication.dart';
import 'package:equatable/equatable.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
    final UserRepository userRepository;
    final AuthenticationBloc authenticationBloc;

  SignInBloc({
    required this.userRepository,
    required this.authenticationBloc
    }) : super(SignInInitialState()) {
    on<SignInEvent>((event, emit) async {
      if (event is SignInPressed) {
        emit(SignInProcessingState());
        try {
          
        } catch (e) {
          emit(SignInErrorState(e.toString()));
        }
      }
    });
  }
}
