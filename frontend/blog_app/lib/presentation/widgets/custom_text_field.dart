import 'package:blog_app/config/utils/constants.dart';
import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final bool? isPassword;
  final IconData? iconData;

  const CustomTextField(
      {Key? key, this.hintText, this.isPassword, this.iconData})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _passwordVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Icon(widget.iconData),
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              width: 300.0,
              child: TextField(
                obscureText: widget.isPassword==true?!_passwordVisibility:false,
                decoration: InputDecoration(
                    hintText: widget.hintText,
                    suffixIcon: widget.isPassword == true
                        ? InkWell(
                            child: _passwordVisibility
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onTap: () {
                              setState(() {
                                _passwordVisibility = !_passwordVisibility;
                              });
                            },
                          )
                        : null,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 4.0),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primaryColor)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
