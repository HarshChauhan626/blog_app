import 'package:blog_app/presentation/features/blog/blog_screen.dart';
import 'package:flutter/material.dart';

class BlogListItem extends StatelessWidget {
  const BlogListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>BlogScreen()));
        },
      child: Padding(
        padding: const EdgeInsets.only(bottom:8.0),
        child: Card(
          elevation: 6.0,
          child: Container(
            child:Row(
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
                  padding: const EdgeInsets.only(left:12.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "30 min read"
                        ),
                        Container(
                          width:300.0,
                          child: Text("If you can't motivate yourself to accomplish basic tasks,You're not",style: Theme.of(context).textTheme.headline6?.copyWith(

                          ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:4.0),
                          child: Container(
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right:8.0),
                                  child: Text("Harsh Chauhan"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right:8.0),
                                  child: Text("20"),
                                ),
                                Text("20h ago")
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



