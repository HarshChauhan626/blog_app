// ignore_for_file: prefer_const_constructors

import 'package:blog_app/domain/repositories/user_repository.dart';
import 'package:blog_app/presentation/features/authentication/authentication_bloc.dart';
import 'package:blog_app/presentation/features/sign_in/sign_in_bloc.dart';
import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:blog_app/presentation/features/forgot_password/forgot_password_screen.dart';
import 'package:blog_app/presentation/features/sign_up/sign_up_screen.dart';
import 'package:blog_app/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  static const String routeName = '/signin';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => BlocProvider<SignInBloc>(
        create: (context) => SignInBloc(
          userRepository: RepositoryProvider.of<UserRepository>(context),
          authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
        ),
        child: SignInScreen(),
      ),
    );
  }

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  bool _passwordVisibility=false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                    height: 250.0, child: SvgPicture.asset("assets/login.svg")),
              )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  'Login',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomTextField(
                  iconData: Icons.mail,
                  hintText: "Email/Username",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomTextField(
                  iconData: Icons.lock,
                  hintText: "Password",
                  isPassword: true,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text("Forgot Password?",style: Theme.of(context).textTheme.subtitle2,),
                  onPressed: (){
                    Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 20.0),
                child: ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                        fixedSize:
                            MaterialStateProperty.all<Size>(Size(500.0,50.0))
                    ),
                    onPressed: () {},
                    child: Center(
                      child: Text("Login"),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.grey,
                        height: 1.0,
                        width: 140.0,
                      ),
                    ),
                    Text('OR',style: Theme.of(context).textTheme.headline6,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.grey,
                        height: 1.0,
                        width: 140.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(
                          40.0
                        ))
                      ),
                      height: 40.0,
                      width: 40.0,
                      child: Center(child: Text("G")),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(
                              40.0
                          ))
                      ),
                      height: 40.0,
                      width: 40.0,
                      child: Center(child: Text("G")),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(
                              40.0
                          ))
                      ),
                      height: 40.0,
                      width: 40.0,
                      child: Center(child: Text("G")),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",style: Theme.of(context).textTheme.bodyText2,),
                    TextButton(onPressed: (){
                      Navigator.pushReplacementNamed(context, SignupScreen.routeName);
                    }, child: Text("Register now"))
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
