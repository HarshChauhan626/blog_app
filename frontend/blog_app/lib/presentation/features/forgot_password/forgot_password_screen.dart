import 'package:blog_app/config/utils/app_colors.dart';
import 'package:blog_app/config/utils/constants.dart';
import 'package:blog_app/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  static const String routeName = '/forgot_password';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ForgotPasswordScreen(),
    );
  }
  
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                          height: 250.0, child: SvgPicture.asset("assets/forgot_password.svg")),
                    )),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Forgot',style: Theme.of(context).textTheme.headline2?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,color: AppColors.darkBlue
                      ),),
                      Text('Password?',style: Theme.of(context).textTheme.headline2?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                        color: AppColors.darkBlue
                      ),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  // color: Colors.red,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Globals.S_FORGOT_PASSWORD_MESSAGE_1,
                        style: Theme.of(context).textTheme.bodyText1),
                      Text(Globals.S_FORGOT_PASSWORD_MESSAGE_2,style: Theme.of(context).textTheme.bodyText1)
                    ],
                  )
                  ),
                ),
                CustomTextField(
                  hintText: Globals.S_FORGOT_PASSWORD_HINT,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:50.0,horizontal: 30.0),
                  child: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                          fixedSize:
                          MaterialStateProperty.all<Size>(Size(500.0,50.0))
                      ),
                      onPressed: () {},
                      child: Center(
                        child: Text(Globals.S_SUBMIT),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





