import 'package:bloc/bloc.dart';
import 'package:blog_app/presentation/features/main_%20screen/main_screen.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenState.initial());

  void bottomNavigation(int index)=> emit(MainScreenState(bottomNavigationIndex: index));


}
