import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appGreyColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back,color: Colors.black,),
        ),
        title: Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for(int i=0;i<30;i++)
              i%6==0?getHeaderItem():getSettingsItem()
          ],
        ),
      ),
    );
  }

  Widget getHeaderItem(){
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
      child: Text("Preferences",style: TextStyle(
        color: Colors.black54,
        fontSize: 16.0
      ),),
    );
  }


  Widget getSettingsItem(){
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("Give us feedback",style: TextStyle(
            fontSize: 18.0
          ),),
          Icon(CupertinoIcons.forward)
        ],
      ),
    );
  }



}





