import 'package:blog_app/config/utils/app_colors.dart';
import 'package:blog_app/presentation/features/sign_in/sign_in_screen.dart';
import 'package:blog_app/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static const String routeName = '/signup';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => SignupScreen(),
    );
  }

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

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
                            height: 250.0, child: SvgPicture.asset("assets/sign_up.svg")),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  CustomTextField(
                    hintText: "Email id"
                  ),
                  CustomTextField(
                    hintText: "First Name",
                  ),
                  CustomTextField(
                    hintText: "Middle Name(Optional)",
                  ),
                  CustomTextField(
                    hintText: "Last Name",
                  ),
                  CustomTextField(
                    hintText: "Mobile number",
                  ),
                  SizedBox(
                    height: 10.0,
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
                          child: Text("Continue"),
                        )),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Joined us before?"),
                        TextButton(
                          onPressed: (){
                            Navigator.pushReplacementNamed(context, SignInScreen.routeName);
                          },
                          child: Text("Login")
                        )
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
