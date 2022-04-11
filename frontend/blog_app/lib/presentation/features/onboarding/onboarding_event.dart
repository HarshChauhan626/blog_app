part of 'onboarding_bloc.dart';

@immutable
abstract class OnboardingEvent extends Equatable{

}

class NextPage extends OnboardingEvent{
  @override
  List<Object?> get props => [];

}
