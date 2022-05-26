import 'dart:math';

import 'package:flutter/material.dart';



Future<void> showAlertDialog(context,{required String content}){
  return showDialog(context: context, builder:(context){
    return AlertDialog(
      title:Text("Alert"),
      content:Text(content),
      actions:[
        Center(
          child: TextButton(
            child:Text("OK"),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        )
      ]
    );
  });
}


int getRandomImageId(){
  int randomNumber=getRandomNumber(1010, 1080);
  if(randomNumber.toString()[3]=="0"){
    return int.parse(randomNumber.toString().substring(0,2));
  }
  return randomNumber;
}

int getRandomNumber(min, max) {
  return min + Random().nextInt(max - min);
}

String getRandomImage()=>"https://picsum.photos/id/${getRandomImageId()}/200/300";



