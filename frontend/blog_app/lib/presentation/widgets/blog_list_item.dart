import 'package:blog_app/presentation/features/blog/blog_screen.dart';
import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

class BlogListItem extends StatelessWidget {
  const BlogListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BlogScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5.0,6.0,20.0,0.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom:BorderSide(
                color: AppColors.appGreyColor
              )
            )
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom:6.0),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    height: 100.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        image: DecorationImage(
                            image: AssetImage("assets/car_pic.jpg"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Chip(
                            padding: const EdgeInsets.all(0.0),
                            labelPadding: const EdgeInsets.all(0.0),
                            label: Center(child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Category",style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                fontSize:10.0
                              ),),
                            )
                            ),
                          ),
                        ),
                        Container(
                          width: 300.0,
                          child: Text(
                            "If you can't motivate yourself to accomplish.",
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(

                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Container(
                                    child: Row(
                                      children:const[
                                        CircleAvatar(
                                          radius: 10.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(3.0,0,20.0,0.0),
                                          child: Text(
                                              "Harsh Chauhan"
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                    "30 min"
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text("20h ago"),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}



