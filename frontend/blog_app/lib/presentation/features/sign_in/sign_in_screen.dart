// ignore_for_file: prefer_const_constructors

import 'package:blog_app/config/utils/enums.dart';
import 'package:blog_app/config/utils/extensions.dart';
import 'package:blog_app/domain/repositories/user_repository.dart';
import 'package:blog_app/presentation/features/authentication/authentication.dart';
import 'package:blog_app/presentation/features/authentication/authentication_bloc.dart';
import 'package:blog_app/presentation/features/home/home_screen.dart';
import 'package:blog_app/presentation/features/main_%20screen/main_screen.dart';
import 'package:blog_app/presentation/features/sign_in/sign_in_bloc.dart';
import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:blog_app/presentation/features/forgot_password/forgot_password_screen.dart';
import 'package:blog_app/presentation/features/sign_up/sign_up_screen.dart';
import 'package:blog_app/presentation/resources/app_strings.dart';
import 'package:blog_app/presentation/widgets/animated_column_widget.dart';
import 'package:blog_app/presentation/widgets/custom_text_field.dart';
import 'package:blog_app/presentation/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:blog_app/presentation/features/home/home.dart';

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


  TextEditingController? emailEditingController;
  TextEditingController? passwordEditingController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailEditingController=TextEditingController();
    passwordEditingController=TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BlocConsumer<SignInBloc,SignInState>(
            listener: (context,state){
              if(state is SignInFinishedState){
                Navigator.pushNamedAndRemoveUntil(context, MainScreen.routeName, (route) => false);
              }
              else if(state is SignInErrorState){
                debugPrint('Something went wrong');
              }
              else{
                debugPrint('Something went wrong else');
              }
            },
            builder: (context,state){

              bool isLoading=state==SignInProcessingState();

              // return Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
              //   child: SingleChildScrollView(
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Center(
              //             child: Padding(
              //               padding: const EdgeInsets.symmetric(vertical: 8.0),
              //               child: Container(
              //                   height: 250.0, child: SvgPicture.asset("assets/login.svg")),
              //             )),
              //         Padding(
              //           padding: const EdgeInsets.symmetric(vertical: 4.0),
              //           child: Text(
              //             'Login',
              //             style: Theme.of(context).textTheme.headline4,
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.symmetric(vertical: 10.0),
              //           child: CustomTextField(
              //             textEditingController:emailEditingController!,
              //             iconData: Icons.mail,
              //             hintText: "Email/Username",
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.symmetric(vertical: 10.0),
              //           child: CustomTextField(
              //             textEditingController:passwordEditingController!,
              //             iconData: Icons.lock,
              //             hintText: "Password",
              //             isPassword: true,
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //           child: Container(
              //             alignment: Alignment.centerRight,
              //             child: TextButton(
              //               child: Text("Forgot Password?",style: Theme.of(context).textTheme.subtitle2,),
              //               onPressed: (){
              //                 Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
              //               },
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 20.0),
              //           child: ElevatedButton(
              //               style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              //                   fixedSize:
              //                   MaterialStateProperty.all<Size>(Size(500.0,50.0)),
              //
              //               ),
              //               onPressed: () {
              //                 BlocProvider.of<SignInBloc>(context).add(SignInPressed(email: emailEditingController?.text??"", password: passwordEditingController?.text??""));
              //               }, child: Center(
              //                 child: Text("Login"),
              //               )),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.symmetric(vertical:8.0),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Container(
              //                   color: Colors.grey,
              //                   height: 1.0,
              //                   width: 140.0,
              //                 ),
              //               ),
              //               Text('OR',style: Theme.of(context).textTheme.headline6,),
              //               Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Container(
              //                   color: Colors.grey,
              //                   height: 1.0,
              //                   width: 140.0,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.symmetric(vertical:8.0),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceAround,
              //             children: [
              //               Container(
              //                 decoration: BoxDecoration(
              //                     color: Colors.blue,
              //                     borderRadius: BorderRadius.all(Radius.circular(
              //                         40.0
              //                     ))
              //                 ),
              //                 height: 40.0,
              //                 width: 40.0,
              //                 child: Center(child: Text("G")),
              //               ),
              //               Container(
              //                 decoration: BoxDecoration(
              //                     color: Colors.blue,
              //                     borderRadius: BorderRadius.all(Radius.circular(
              //                         40.0
              //                     ))
              //                 ),
              //                 height: 40.0,
              //                 width: 40.0,
              //                 child: Center(child: Text("G")),
              //               ),
              //               Container(
              //                 decoration: BoxDecoration(
              //                     color: Colors.blue,
              //                     borderRadius: BorderRadius.all(Radius.circular(
              //                         40.0
              //                     ))
              //                 ),
              //                 height: 40.0,
              //                 width: 40.0,
              //                 child: Center(child: Text("G")),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Row(mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text("Don't have an account?",style: Theme.of(context).textTheme.bodyText2,),
              //               TextButton(onPressed: (){
              //                 Navigator.pushReplacementNamed(context, SignupScreen.routeName);
              //               },
              //                   child: Text("Register now")
              //               )
              //             ],
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // );
              return SingleChildScrollView(
                child: AnimatedColumn(
                  children: [
                    getHeaderImageWidget(),
                    Text(
                      "Welcome Back!",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontWeight: FontWeight.w900, color: AppColors.primaryColor),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Please sign in to your account",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: AppColors.greyColor),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        child: InputTextField(
                          onChangedValue: (value) {
                            debugPrint(value);
                            emailEditingController?.text=value;
                          },
                          hintText: "Email",
                          inputTextType: InputTextType.email,
                        )),
                    Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        child: InputTextField(
                          onChangedValue: (value) {
                            debugPrint(value);
                            passwordEditingController?.text=value;
                          },
                          hintText: "Password",
                          inputTextType: InputTextType.password,
                        )),
                    // const SizedBox(
                    //   height: 10.0,
                    // ),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                        },
                        child: Text(
                          AppStrings.forgotPassword,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(color: AppColors.primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child:
                      ElevatedButton(
                          style:ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return AppColors.primaryColor;
                                } else if (states.contains(MaterialState.disabled)) {
                                  return AppColors.primaryColor.darken(30);
                                }
                                return AppColors.primaryColor; // Use the component's default./ Use the component's default.
                              },
                            ),),
                          onPressed:isLoading?null: () async{
                            BlocProvider.of<SignInBloc>(context).add(SignInPressed(email: emailEditingController?.text??"", password: passwordEditingController?.text??""));
                            }, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if(isLoading)
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: SizedBox(
                                height: 23.0,
                                width: 23.0,
                                child: CircularProgressIndicator(
                                  color: AppColors.whiteColor,
                                  strokeWidth: 3.0,
                                ),
                              ),
                            ),
                          if(!isLoading)
                            const Text("Sign In")
                        ],
                      )),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.textFieldBackgroundColor,
                              elevation: 3.0),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 30.0,
                                  child: SvgPicture.asset("assets/icons8-google.svg")),
                              Text(
                                "Sign in with Google",
                                style: Theme.of(context).textTheme.button?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blackTextColor),
                              )
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 60.0,
                    ),
                    getNavigateToSignUpWidget()
                  ],
                ),
              );
            },
          )
      ),
    );
  }




  Widget getNavigateToSignUpWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, SignupScreen.routeName);
            },
            child: const Text('Sign Up'))
      ],
    );
  }

  Widget getHeaderImageWidget(){
    return
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: SizedBox(
          height: 120.0,
          child: SvgPicture.asset("assets/personalization.svg"),
        ),
      );
  }




}
