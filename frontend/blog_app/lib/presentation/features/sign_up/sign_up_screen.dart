import 'package:blog_app/config/utils/enums.dart';
import 'package:blog_app/domain/repositories/user_repository.dart';
import 'package:blog_app/presentation/features/authentication/authentication_bloc.dart';
import 'package:blog_app/presentation/features/sign_up/sign_up_bloc.dart';
import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:blog_app/presentation/features/sign_in/sign_in_screen.dart';
import 'package:blog_app/presentation/widgets/animated_column_widget.dart';
import 'package:blog_app/presentation/widgets/custom_safe_area.dart';
import 'package:blog_app/presentation/widgets/custom_text_field.dart';
import 'package:blog_app/presentation/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static const String routeName = '/signup';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(
          userRepository: RepositoryProvider.of<UserRepository>(context),
          authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
        ),
        child: SignupScreen(),
      ),
    );
  }

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool _passwordVisibility=false;


  TextEditingController? emailEditingController;
  TextEditingController? firstNameEditingController;
  TextEditingController? middleNameEditingController;
  TextEditingController? lastNameEditingController;
  TextEditingController? userNameEditingController;
  TextEditingController? mobileNumberEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailEditingController=TextEditingController();
    firstNameEditingController=TextEditingController();
    middleNameEditingController=TextEditingController();
    lastNameEditingController=TextEditingController();
    userNameEditingController=TextEditingController();
    mobileNumberEditingController=TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
        child: Scaffold(
          appBar: AppBar(
            // leading: Padding(
            //   padding: const EdgeInsets.all(6.0),
            //   child: InkWell(
            //     onTap: (){
            //       Navigator.pop(context);
            //     },
            //     child: Container(
            //       decoration: BoxDecoration(
            //           border: Border.all(
            //             color: AppColors.blackTextColor,
            //           ),
            //           borderRadius: BorderRadius.circular(10.0)
            //       ),
            //       child: const Icon(CupertinoIcons.back,color: AppColors.blackTextColor,),
            //     ),
            //   ),
            // )
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: AnimatedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Create a new account',
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Sign up to get started',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: Colors.black38),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  InputTextField(
                      onChangedValue: (value) {},
                      hintText: "Username",
                      inputTextType: InputTextType.username),
                  const SizedBox(
                    height: 14.0,
                  ),
                  InputTextField(
                      onChangedValue: (value) {},
                      hintText: "First name",
                      inputTextType: InputTextType.username),
                  const SizedBox(
                    height: 14.0,
                  ),
                  InputTextField(
                      onChangedValue: (value) {},
                      hintText: "Last name",
                      inputTextType: InputTextType.username),
                  const SizedBox(
                    height: 14.0,
                  ),
                  InputTextField(
                      onChangedValue: (value) {},
                      hintText: "Email",
                      inputTextType: InputTextType.email),
                  const SizedBox(
                    height: 14.0,
                  ),
                  InputTextField(
                      onChangedValue: (value) {},
                      hintText: "Password",
                      inputTextType: InputTextType.password),
                  const SizedBox(
                    height: 40.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Sign up'),
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  ElevatedButton(
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
                            "Sign up with Google",
                            style: Theme.of(context).textTheme.button?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.blackTextColor),
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already a member?",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SignInScreen.routeName);
                          },
                          child: const Text('Sign In'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
