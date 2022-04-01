import 'package:blog_app/domain/repositories/user_repository.dart';
import 'package:blog_app/presentation/features/authentication/authentication_bloc.dart';
import 'package:blog_app/presentation/features/authentication/authentication_event.dart';
import 'package:blog_app/presentation/features/sign_up/sign_up_event.dart';
import 'package:blog_app/presentation/features/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_up.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  SignUpBloc({
    required this.userRepository,
    required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(SignUpInitialState()) {
    on<SignUpEvent>((event, emit) async {
      // normal sign up
      if (event is SignUpPressed) {
        emit(SignUpProcessingState());
        try {
          final token = await userRepository.signUpUser();
          authenticationBloc.add(LoggedIn(token));
          emit(SignUpFinishedState());
        } catch (error) {
          emit(SignUpErrorState(error.toString()));
        }
      }

      // sign up with facebook
      if (event is SignUpPressedFacebook) {
        emit(SignUpProcessingState());
        try {
          await Future.delayed(
            Duration(milliseconds: 300),
          ); //TODO use real auth service

          emit(SignUpFinishedState());
        } catch (error) {
          emit(SignUpErrorState(error.toString()));
        }
      }

      //sign up with google
      if (event is SignUpPressedGoogle) {
        emit(SignUpProcessingState());
        try {
          await Future.delayed(
            Duration(milliseconds: 100),
          ); //TODO use real auth service

          emit(SignUpFinishedState());
        } catch (error) {
          emit(SignUpErrorState(error.toString()));
        }
      }
    });
  }

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    // normal sign up
    if (event is SignUpPressed) {
      yield SignUpProcessingState();
      try {
        final token = await userRepository.signUpUser();
        authenticationBloc.add(LoggedIn(token));
        yield SignUpFinishedState();
      } catch (error) {
        yield SignUpErrorState(error.toString());
      }
    }

    // sign up with facebook
    if (event is SignUpPressedFacebook) {
      yield SignUpProcessingState();
      try {
        await Future.delayed(
          Duration(milliseconds: 300),
        ); //TODO use real auth service

        yield SignUpFinishedState();
      } catch (error) {
        yield SignUpErrorState(error.toString());
      }
    }

    //sign up with google
    if (event is SignUpPressedGoogle) {
      yield SignUpProcessingState();
      try {
        await Future.delayed(
          Duration(milliseconds: 100),
        ); //TODO use real auth service

        yield SignUpFinishedState();
      } catch (error) {
        yield SignUpErrorState(error.toString());
      }
    }
  }
}
