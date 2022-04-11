part of 'onboarding_bloc.dart';

@immutable
abstract class OnboardingState extends Equatable{

}

class OnboardingInitial extends OnboardingState {

  int selectedPage;

  OnboardingInitial({required this.selectedPage});

  @override
  List<Object?> get props => [selectedPage];
}




