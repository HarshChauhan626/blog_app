
import 'package:blog_app/presentation/features/explore/explore_screen.dart';
import 'package:blog_app/presentation/features/home/home_screen.dart';
import 'package:blog_app/presentation/features/main_%20screen/main_screen_cubit.dart';
import 'package:blog_app/presentation/features/profile/profile_screen.dart';
import 'package:blog_app/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String routeName = '/main';


  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => BlocProvider<MainScreenCubit>(
        create: (context) => MainScreenCubit(

        ),
        child: MainScreen(),
      ),
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
          body: IndexedStack(
            index:2,
            children: const [
              HomeScreen(),
              ExploreScreen(),
              ProfileScreen()
            ],
          ),
          bottomNavigationBar: Container(
            height: 50.0,
            alignment: Alignment.center,
            child: Center(child: MyCustomBottomNavigationBar()),
          )
      ),
    );
  }



}






