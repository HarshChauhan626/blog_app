import 'package:blog_app/presentation/features/blog/blog.dart';
import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:blog_app/presentation/widgets/blog_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'explore_bloc.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  static const String routeName = '/explore';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => BlocProvider<ExploreBloc>(
        create: (context) => ExploreBloc(),
        child: ExploreScreen(),
      ),
    );
  }

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Explore"),
          centerTitle: false,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom:60.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.primaryColor,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trending',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      InkWell(
                        child: Text('Show all',style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: AppColors.greyColor
                        ),),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(
                    height: 360.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => BlogScreen()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0,right: 7.0,bottom: 10.0),
                              child: Container(
                                  height: 250.0,
                                  width: 300.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade200,
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(2, 3), // changes position of shadow
                                        ),
                                        BoxShadow(
                                          color: Colors.grey.shade200,
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ]
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0,top: 15.0),
                                        child: Container(
                                          height: 200.0,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      "assets/car_pic.jpg"))),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(left: 10.0,top: 10.0),
                                        child: Row(
                                          children: [
                                            Text("DESIGN",style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                              color: AppColors.greyColor
                                            ),
                                            ),
                                            SizedBox(width: 10.0,),
                                            CircleAvatar(
                                              backgroundColor: AppColors.primaryColor,
                                              radius: 2.0,
                                            ),
                                            SizedBox(width: 10.0,),
                                            Text('INTERIOR',style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                                color: AppColors.greyColor
                                            ),),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                        child: Text(
                                          "100 interior design reference and tips ideas for you",
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
                                        padding: const EdgeInsets.only(left:10.0,top: 5.0,bottom:6.0,right: 10.0),
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(right: 8.0),
                                                child: Container(
                                                  child: Row(
                                                    children:[
                                                      CircleAvatar(
                                                        backgroundColor: Colors.green,
                                                        radius: 8.0,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0.0),
                                                        child: Text(
                                                          "Harsh Chauhan",
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
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recommended',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      InkWell(
                        child: Text('Show all',style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: AppColors.greyColor
                        ),),
                      )
                    ],
                  ),
                ),
                for(int i=0;i<10;i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: BlogListItem(),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Text('Who to follow',style: Theme.of(context).textTheme.headline5),
                ),
                Container(
                  height: 270.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for(int i=0;i<10;i++)
                        peopleSuggestion()
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget peopleSuggestion(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(2, 3), // changes position of shadow
              ),
              BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0,top: 0.0),
              child: Container(
                height: 100.0,
                width: 150.0,
                decoration: BoxDecoration(
                  color: Colors.red,
                    borderRadius:
                    BorderRadius.circular(15.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "assets/car_pic.jpg"))
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
              width: 170.0,
              child: Text(
                "Harsh Chauhan",
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
              width: 170.0,
              child: Text("22 | Startup Founder | Software Engineer | Blogger | Artist",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(
                    fontSize: 12.0
                ),
                textAlign: TextAlign.start,),
            ),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: (){
                setState(() {
                  // toggle=!toggle;
                });
              },
              child: AnimatedContainer(
                width: 150.0,
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                    color: 1==0?AppColors.primaryColor:Colors.white,
                    border: Border.all(
                        color: AppColors.primaryColor,
                        width: 1.0
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(6.0))
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(1==0?'Follow':"Following",style: Theme.of(context).textTheme.button?.copyWith(
                        color: 1==0?Colors.white:Colors.black
                    ),),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }



}
