import 'package:bloc/bloc.dart';
import 'package:blog_app/config/utils/enums.dart';
import 'package:blog_app/data/network/failure.dart';
import 'package:blog_app/data/request/request.dart';
import 'package:blog_app/domain/repositories/blog_repository.dart';
import 'package:blog_app/presentation/features/sign_in/sign_in_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BlogRepository blogRepository;

  HomeBloc({required this.blogRepository}) : super(HomeInitialState(activePageIndex: 0)){
    on<HomeEvent>((event, emit) async{
      if ((event is HomeTabChanged && state.activePageIndex!=event.tabIndex)) {
        emit(HomeLoadingState(activePageIndex: event.tabIndex));
        try {
          // var result = await userRepository.authenticateUser(
          //     LoginRequest(email: event.email, password: event.password)
          // );
          final result=await blogRepository.getBlogList(BlogListRequest(currentIndex: 20, listType:ListType.Followed.index));
          print(result);
          result.when(success: (blogListResponse){
            print(blogListResponse);
            emit(HomeLoadedState(
              blogListEntity: blogListResponse,
              activePageIndex: event.tabIndex
            ));
          }, failure: (ApiFailure apifailure){
            emit(HomeErrorState(errorText:apifailure.message.toString(),activePageIndex: event.tabIndex));
          });
        } catch (e) {
          emit(HomeErrorState(errorText: e.toString(),activePageIndex: event.tabIndex));
        }
      }
    });
  }
  
  



}
