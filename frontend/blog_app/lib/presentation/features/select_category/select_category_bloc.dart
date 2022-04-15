import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'select_category_event.dart';
part 'select_category_state.dart';

class SelectCategoryBloc extends Bloc<SelectCategoryEvent, SelectCategoryState> {
  SelectCategoryBloc() : super(SelectCategoryInitial()) {
    on<SelectCategoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
