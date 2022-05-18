
import 'package:blog_app/presentation/features/collection/collection_screen.dart';
import 'package:blog_app/presentation/features/explore/explore_screen.dart';
import 'package:blog_app/presentation/features/home/home_bloc.dart';
import 'package:blog_app/presentation/features/home/home_screen.dart';
import 'package:blog_app/presentation/features/main_%20screen/main_screen_cubit.dart';
import 'package:blog_app/presentation/features/profile/profile_screen.dart';
import 'package:blog_app/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:blog_app/presentation/widgets/custom_bottom_navigation_bar_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String routeName = '/main';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      // builder: (_) => BlocProvider<MainScreenCubit>(
      //   create: (context) => MainScreenCubit(
      //
      //   ),
      //   child: MainScreen(),
      // ),
        builder: (_) =>MultiBlocProvider(providers: [
            BlocProvider(create: (context)=>MainScreenCubit()),
            BlocProvider(create: (context)=>HomeBloc()),
        ], child: MainScreen())
    );
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
          body: getBody(),
          bottomSheet: Container(
            height: 70.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(
                    10.0,
                    0.0
                  )
                ),
                BoxShadow(
                    color: Colors.white12,
                    offset: Offset(
                        10.0,
                        10.0
                    )
                ),
              ]
            ),
            alignment: Alignment.center,
            child: Center(child: BottomNavbar(
              callback: (int index){
                BlocProvider.of<MainScreenCubit>(context).bottomNavigation(index);
              },
            )),
          )
      ),
    );
  }


  Widget getBody(){
    return BlocConsumer<MainScreenCubit, MainScreenState>(builder: (context,state){
      return IndexedStack(
        index:state.bottomNavigationIndex,
        children: const [
          HomeScreen(),
          ExploreScreen(),
          CollectionScreen(),
          ProfileScreen()
        ],
      );
    }, listener:(context,state){
      debugPrint(state.bottomNavigationIndex.toString());
    });
  }


}






