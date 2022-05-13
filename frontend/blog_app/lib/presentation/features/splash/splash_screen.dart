import 'package:blog_app/presentation/features/home/home_screen.dart';
import 'package:blog_app/presentation/features/main_%20screen/main_screen.dart';
import 'package:blog_app/presentation/features/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/presentation/features/authentication/authentication.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => SplashScreen(),
    );
  }

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Use bloc methods in build methods
    return BlocListener<AuthenticationBloc,AuthenticationState>(
      listener: (context,state){
        print("State coming is $state");
        if(state is Authenticated){
        Future.delayed(Duration(seconds: 2),(){
          Navigator.pushReplacementNamed(context, MainScreen.routeName);
        });
        }
        else{
          Future.delayed(Duration(seconds: 2),(){
            Navigator.pushReplacementNamed(context, SignInScreen.routeName);
          });
        }
      },
      child: Scaffold(
        body: Container(
          color: Colors.red,
          child: const Center(
            child: Text("Blogger"),
          ),
        ),
      ),
    );

  }
}
