import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInEvent>((event, emit) async {
      if (event is SignInPressed) {
        emit(SignInProcessingState());
        try {} catch (e) {
          emit(SignInErrorState(e.toString()));
        }
      }
    });
  }
}
