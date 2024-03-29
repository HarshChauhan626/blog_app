import 'package:blog_app/config/utils/util_functions.dart';
import 'package:blog_app/data/datasources/local/fake_data_service.dart';
import 'package:blog_app/domain/entities/blog.dart';
import 'package:blog_app/presentation/features/blog/blog_screen.dart';
import 'package:blog_app/presentation/features/collection/collection_sheet.dart';
import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../../di.dart';

class BlogListItem extends StatelessWidget {


  BlogListItem({Key? key,required this.blog}) : super(key: key);


  BlogEntity? blog;

  @override
  Widget build(BuildContext context) {
    print("Blog coming in stless widget ${blog}");
    if(blog!=null){
      return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BlogScreen()));
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0,5.0,5.0,5.0),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   child: Chip(
                          //     padding: const EdgeInsets.all(0.0),
                          //     labelPadding: const EdgeInsets.all(0.0),
                          //     label: Center(child:Padding(
                          //       padding: const EdgeInsets.all(2.0),
                          //       child: Text("Category",style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          //           fontSize:10.0
                          //       ),),
                          //     )
                          //     ),
                          //   ),
                          //   height: 30.0,
                          // ),
                          // getTags(context),
                          Container(
                            width: 260.0,
                            child: Text(
                              Faker().lorem.sentence().toString(),
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                  fontSize: 18.0
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0,bottom:6.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Row(
                                    children:[
                                      CircleAvatar(
                                        backgroundColor: Colors.green,
                                        radius: 8.0,
                                        backgroundImage: NetworkImage(
                                            instance<FakeDataSource>().fakeImage
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0.0),
                                        child: Text(
                                          instance<FakeDataSource>().fakeName,
                                          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                              fontSize: 12.0,
                                              color: Colors.black45,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "30 min",
                                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                      fontSize: 12.0,
                                      color: Colors.black45
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text("20h ago",
                                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                        fontSize: 12.0,
                                        color: Colors.black45
                                    ),),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 120.0,
                    // color: Colors.red,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 72.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              image: DecorationImage(
                                // image: AssetImage("assets/car_pic.jpg"),
                                  image: NetworkImage("https://picsum.photos/id/${getRandomImageId()}/200/300"),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              padding:const EdgeInsets.all(0),
                              icon: Icon(Icons.bookmark_border),
                              onPressed: (){
                                showModalBottomSheet(context: context, builder: (context){
                                  return CollectionSheet();
                                });
                              },
                            ),
                            IconButton(
                              padding: const EdgeInsets.all(0),
                              icon: Icon(Icons.more_vert),
                              onPressed: (){},
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return SizedBox();
  }

  Widget getTags(BuildContext context){
    List<Widget> tagCardList=[];
    int index=0;
    if(blog!=null && blog!.tag!=null && blog!.tag!.isNotEmpty){
      while(tagCardList.length<3){
        tagCardList.add(getTagItem(context, index));
        index+=1;
      }
      return Row(
        children: tagCardList,
      );
      // return Row(
      //   children: [
      //     for(int i=0;i<blog!.tag!.length;i++)
      //
      //   ],
      // );
    }
    return SizedBox();
  }

  Widget getTagItem(BuildContext context,int i){
    return Padding(
      padding: const EdgeInsets.only(bottom:6.0),
      child: Container(
        height: 25.0,
        width: 70.0,
        decoration: BoxDecoration(
            color: AppColors.appGreyColor,
            borderRadius: BorderRadius.circular(20.0)
        ),
        child: Center(child:Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text("${this.blog!.tag![i]}",style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontSize:10.0
          ),),
        )
        ),
      ),
    );
  }

}



