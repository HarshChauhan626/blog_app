import 'package:blog_app/config/utils/util_functions.dart';
import 'package:blog_app/presentation/features/author_profile/author_profile_screen.dart';
import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  bool toggle=false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notifications",style: Theme.of(context).textTheme.headline6?.copyWith(
            fontWeight: FontWeight.w900
          ),),
          leading: IconButton(
            icon: Icon(CupertinoIcons.back,color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        body:ListView.builder(
          itemCount: 15,
            itemBuilder: (context,index){
          return Container(
            child: peopleListItem("Harsh Chauhan","Started Following you"),
          );
        })
        // body: Container(),
      ),
    );
  }

  Widget peopleListItem(String title,String subTitle){
    return Padding(
      padding: const EdgeInsets.only(top:0.0,left: 0.0,right: 0.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthorProfileScreen(isUserProfile: false,)));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            // color: Colors.blue,
              border: Border(
                  bottom:BorderSide(
                      width: 4.0,
                      color: AppColors.appGreyColor
                  )
              )
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    getRandomImage()
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900
                    ),),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      child: Text(subTitle,style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: Colors.black54,
                          fontSize: 12.0
                      ),
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.start,
                      ),
                    )
                  ],
                ),
              ),
              // Spacer(),
              InkWell(
                onTap: (){
                  setState(() {
                    toggle=!toggle;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                      color: toggle?AppColors.primaryColor:Colors.white,
                      border: Border.all(
                          color: AppColors.primaryColor,
                          width: 1.0
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(6.0))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(toggle?'Follow':"Following",style: Theme.of(context).textTheme.button?.copyWith(
                        color: toggle?Colors.white:Colors.black
                    ),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }





}






