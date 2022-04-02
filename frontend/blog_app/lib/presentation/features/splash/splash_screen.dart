import 'package:blog_app/presentation/features/home/home_screen.dart';
import 'package:blog_app/presentation/features/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/presentation/features/authentication/authentication.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

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
  void navigateToHome() async {
    Future.delayed(Duration(seconds: 2), () {
      BlocListener<AuthenticationBloc,AuthenticationState>(
        listener: (context,state){
          if(state is Authenticated){
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          }
          else{
            Navigator.pushReplacementNamed(context, SignInScreen.routeName);
          }
        },
      );
    });
  }

  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: const Center(
          child: Text("Blogger"),
        ),
      ),
    );
  }
}
