import 'package:bloc/bloc.dart';

import 'home_event.dart';
import 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
      if(event is HomeTabChanged){
        emit(HomeLoadedState(activePageIndex:event.tabIndex));
      }
    });
  }
}
