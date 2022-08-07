import 'package:blog_app/presentation/features/main_%20screen/main_screen.dart';
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


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Use bloc methods in build methods
    return BlocListener<AuthenticationBloc,AuthenticationState>(
      listener: (context,state){
        debugPrint("State coming is $state");
        if(state is Authenticated){
        Future.delayed(Duration(seconds: 2),(){
          Navigator.pushNamedAndRemoveUntil(context, MainScreen.routeName,(Route route) => false);
        });
        }
        else{
          Future.delayed(Duration(seconds: 2),(){
            Navigator.pushNamedAndRemoveUntil(context, SignInScreen.routeName,(Route route) => false);
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
