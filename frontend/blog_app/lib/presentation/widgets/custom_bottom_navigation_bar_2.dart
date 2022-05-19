import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class BottomNavbar extends StatefulWidget {
  final Function callback;
  const BottomNavbar({Key? key, required this.callback}) : super(key: key);
  @override
  BottomNavbarState createState() => BottomNavbarState();
}

class BottomNavbarState extends State<BottomNavbar> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        // margin: EdgeInsets.all(20),
        // height: screenWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(10.0),
          //   topRight: Radius.circular(10.0)
          // ),
        ),
        // child: ListView.builder(
        //   itemCount: 4,
        //   scrollDirection: Axis.horizontal,
        //   padding: EdgeInsets.symmetric(horizontal: screenWidth * .024),
        //   itemBuilder: (context, index) => ,
        // ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for(int index=0;index<4;index++)
              InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                    widget.callback(index);
                    HapticFeedback.lightImpact();
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Stack(
                  children: [
                    SizedBox(
                      width: screenWidth * .2125,
                      child: Center(
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height: index == currentIndex ? screenWidth * .10 : 0,
                          width: index == currentIndex ? screenWidth * .16 : 0,
                          decoration: BoxDecoration(
                            color: index == currentIndex
                                ? AppColors.lightPinkColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * .2125,
                      alignment: Alignment.center,
                      child: Icon(
                        listOfIcons[index],
                        size: screenWidth * .07,
                        color: index == currentIndex
                            ? AppColors.primaryColor
                            : Colors.black38,
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_outlined,
    Icons.search_outlined,
    Icons.bookmark_border,
    Icons.person_outlined,
  ];
}