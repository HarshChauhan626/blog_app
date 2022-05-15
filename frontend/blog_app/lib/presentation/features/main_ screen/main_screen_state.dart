part of 'main_screen_cubit.dart';


class MainScreenState extends Equatable{

  final bottomNavigationIndex;

  const MainScreenState({this.bottomNavigationIndex});

  factory MainScreenState.initial() {
    return MainScreenState(
        bottomNavigationIndex: 0);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [bottomNavigationIndex];

  MainScreenState copyWith(
      {int? bottomNavigationIndex}) {
    return MainScreenState(
      bottomNavigationIndex: bottomNavigationIndex
    );
  }


}
