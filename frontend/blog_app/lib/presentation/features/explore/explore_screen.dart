import 'package:blog_app/config/utils/util_functions.dart';
import 'package:blog_app/data/datasources/local/fake_data_service.dart';
import 'package:blog_app/domain/entities/blog.dart';
import 'package:blog_app/presentation/features/author_profile/author_profile_screen.dart';
import 'package:blog_app/presentation/features/blog/blog.dart';
import 'package:blog_app/presentation/features/search/search_screen.dart';
import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:blog_app/presentation/widgets/blog_list_item.dart';
import 'package:blog_app/presentation/widgets/custom_safe_area.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di.dart';
import 'explore_bloc.dart';

var faker=Faker();

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
    return CustomSafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("Explore"),
        //   centerTitle: false,
        //   automaticallyImplyLeading: false,
        // ),
        body: Padding(
          padding: const EdgeInsets.only(bottom:60.0),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(40.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0,bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                            child: Text("Discover",style: Theme.of(context).textTheme.headline5?.copyWith(
                              fontWeight: FontWeight.bold
                            ),)),
                        // Text("Blogs from people all over the world",style: Theme.of(context).textTheme.subtitle2,)
                      ],
                    ),
                  ),
                ),
              ),
              // SliverToBoxAdapter(
              //   child: SizedBox(
              //     height: 10.0,
              //   ),
              // ),
              SliverToBoxAdapter(
                child: _getBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getBody(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
          child: Container(
            // height: 45.0,
            // margin: const EdgeInsets.symmetric(vertical: 30),
            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.appGreyColor,
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: TextField(
              controller: _textEditingController,
              showCursor: true,
              readOnly: true,
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchScreen()));
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.appGreyColor,
                  // focusColor: AppColors.greyColor,
                  // hoverColor: AppColors.appGreyColor,
                  // focusedBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(color: AppColors.primaryColor),
                  //     borderRadius: BorderRadius.all(Radius.circular(15))),
                  // border: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.white),
                  //     borderRadius: BorderRadius.all(Radius.circular(15))
                  // ),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.primaryColor,
                  )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending',
                style: Theme.of(context).textTheme.headline6,
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
                                          // image: AssetImage(
                                          //     "assets/car_pic.jpg")
                                        image: NetworkImage(
                                            "https://picsum.photos/id/${getRandomImageId()}/400/400"
                                        )
                                      )),
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
                style: Theme.of(context).textTheme.headline6,
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
            child: BlogListItem(
              blog: BlogEntity(),
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 5.0),
          // child: Text('Who to follow',style: Theme.of(context).textTheme.headline6),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Who to follow',
                style: Theme.of(context).textTheme.headline6,
              ),
              Spacer()
            ],
          )
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
    );
  }


  Widget peopleSuggestion(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 5.0),
      child: GestureDetector(
        onTap: (){
          print(1);
          Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthorProfileScreen(isUserProfile: false,)));
        },
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
                          // image: AssetImage(
                          //     "assets/car_pic.jpg")
                        image: NetworkImage("https://picsum.photos/id/${getRandomImageId()}/200/300")
                      )
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                width: 170.0,
                child: Text(
                  "${faker.person.firstName()+" "+faker.person.lastName()}",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(
                      fontSize: 18.0
                  ),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                width: 170.0,
                height: 75.0,
                child: Text("22 | Startup Founder | Software Engineer | Blogger | Artist 22 | Startup Founder | Software Engineer | Blogger | Artist 22 | Startup Founder | Software Engineer | Blogger | Artist".substring(0,80),
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(
                      fontSize: 12.0,
                    fontWeight: FontWeight.normal
                  ),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                ),
              ),
              SizedBox(
                height: 10.0,
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
      ),
    );
  }



}
