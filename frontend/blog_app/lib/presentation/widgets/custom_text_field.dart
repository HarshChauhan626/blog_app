import 'package:blog_app/config/utils/constants.dart';
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {

  final String? hintText;

  const CustomTextField({Key? key,this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Icon(Icons.mail),
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              width: 300.0,
              child: TextField(
                decoration: InputDecoration(
                  hintText: this.hintText
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



