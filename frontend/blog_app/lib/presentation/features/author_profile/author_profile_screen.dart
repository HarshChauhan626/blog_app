import 'package:blog_app/config/utils/util_functions.dart';
import 'package:blog_app/presentation/features/collection/create_collection/create_collection_popup.dart';
import 'package:blog_app/presentation/features/people/people_screen.dart';
import 'package:blog_app/presentation/features/settings/settings.dart';
import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:blog_app/presentation/widgets/blog_list_item.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class AuthorProfileScreen extends StatefulWidget {
  bool isUserProfile;AuthorProfileScreen({Key? key,required this.isUserProfile}) : super(key: key);

  @override
  State<AuthorProfileScreen> createState() => _AuthorProfileScreenState();
}

class _AuthorProfileScreenState extends State<AuthorProfileScreen> with SingleTickerProviderStateMixin{

  bool toggle=false;

  TabController? _tabController;
  ScrollController? _scrollController;
  bool showTitle=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 2, vsync: this);
    _scrollController=ScrollController();
    _scrollController?.addListener(() {
      if(_scrollController?.position.userScrollDirection==ScrollDirection.reverse){
        print("REverse");
        setState(() {
          showTitle=true;
        });
      }
      else{
        print("Normal");
        setState(() {
          showTitle=false;
        });
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   // elevation: 2.0,
        //   leading: IconButton(
        //     icon: Icon(CupertinoIcons.back,color: Colors.black,),
        //     onPressed: (){
        //       Navigator.pop(context);
        //     },
        //   ),
        //   actions: [
        //     IconButton(
        //       icon: Icon(Icons.more_vert,color: Colors.black,),
        //       onPressed: (){
        //
        //       },
        //     )
        //   ],
        // ),
        // body: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10.0),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Container(
        //               child: Row(
        //                 children: [
        //                   CircleAvatar(
        //                     radius: 32.0,
        //                     backgroundImage: NetworkImage(
        //                         getRandomImage()
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     width: 10.0,
        //                   ),
        //                   Container(
        //                     child: Column(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         Text("${Faker().person.name()}",style: Theme.of(context).textTheme.bodyText1?.copyWith(
        //                           fontWeight: FontWeight.bold,
        //                           fontSize: 20.0
        //                         ),),
        //                         SizedBox(
        //                           height: 10.0,
        //                         ),
        //                         Text("${Faker().internet.email()}",style: Theme.of(context).textTheme.subtitle1?.copyWith(
        //                           fontSize: 12.0
        //                         ),)
        //                       ],
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             InkWell(
        //               onTap: (){
        //                 setState(() {
        //                   toggle=!toggle;
        //                 });
        //               },
        //               child: AnimatedContainer(
        //                 duration: Duration(milliseconds: 200),
        //                 decoration: BoxDecoration(
        //                     color: toggle?AppColors.primaryColor:Colors.white,
        //                     border: Border.all(
        //                         color: AppColors.primaryColor,
        //                         width: 1.0
        //                     ),
        //                     borderRadius: BorderRadius.all(Radius.circular(6.0))
        //                 ),
        //                 child: Padding(
        //                   padding: const EdgeInsets.all(8.0),
        //                   child: Text(toggle?'Follow':"Following",style: Theme.of(context).textTheme.button?.copyWith(
        //                       color: toggle?Colors.white:Colors.black
        //                   ),),
        //                 ),
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10.0),
        //         child: getFriendsWidget(),
        //       )
        //     ],
        //   ),
        // ),
        body: Padding(
          padding: const EdgeInsets.only(bottom:50.0),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: 290.0,
                collapsedHeight: 60.0,
                title: showTitle?Text("Harsh Chauhan"):null,
                elevation: 2.0,
                automaticallyImplyLeading: false,
                floating: false,
                pinned: true,
                // snap: true,
                leading: !widget.isUserProfile?IconButton(
                  icon: Icon(CupertinoIcons.back,color: Colors.black,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ):null,
                actions: [
                  widget.isUserProfile?IconButton(
                    icon: Icon(Icons.settings,color: Colors.black,),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
                    },
                  ):IconButton(
                    icon: Icon(Icons.more_vert,color: Colors.black,),
                    onPressed: (){

                    },
                  )
                ],
                // bottom: PreferredSize(
                //   preferredSize: Size.fromHeight(40.0),
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Container(
                //             alignment: Alignment.centerLeft,
                //             child: Text(
                //               "Collections",
                //               style: Theme.of(context)
                //                   .textTheme
                //                   .headline5
                //                   ?.copyWith(fontWeight: FontWeight.bold),
                //             )),
                //         // Text("Blogs from people all over the world",style: Theme.of(context).textTheme.subtitle2,)
                //       ],
                //     ),
                //   ),
                // ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(30.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top:0.0,left: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        isScrollable: true,
                        unselectedLabelColor: AppColors.appGreyColor,
                        // padding: const EdgeInsets.all(3.0),
                        // indicatorPadding: const EdgeInsets.only(top: 10.0),
                        controller: _tabController,
                        indicatorWeight: 2.0,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: AppColors.primaryColor,
                        // indicatorPadding: const EdgeInsets.only(right: 30.0,left:30.0),
                        tabs: [
                          Padding(
                            padding: const EdgeInsets.only(bottom:8.0),
                            child: Text('Posts',style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                fontSize: 14.0
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom:8.0),
                            child: Text('Bio',style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                fontSize: 14.0
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // flexibleSpace: FlexibleSpaceBar(
                //   collapseMode: CollapseMode.pin,
                //   centerTitle: true,
                //   background: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Container(
                //             alignment: Alignment.centerLeft,
                //             child: Text(
                //               "Collections",
                //               style: Theme.of(context)
                //                   .textTheme
                //                   .headline5
                //                   ?.copyWith(fontWeight: FontWeight.bold),
                //             )),
                //         InkWell(
                //           onTap: (){
                //             // TODO:- Implement bottom sheet on click of this.
                //             showModalBottomSheet(
                //                 isScrollControlled: true,
                //                 shape: RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
                //                 context: context, builder: (context){
                //               return CollectionPopup();
                //             });
                //           },
                //           child: Container(
                //             alignment: Alignment.center,
                //             height: 35.0,
                //             width: 90.0,
                //             decoration: BoxDecoration(
                //                 color: AppColors.primaryColor,
                //                 borderRadius: BorderRadius.circular(20.0)
                //             ),
                //             child: Text('Create',style: Theme.of(context).textTheme.bodyText1?.copyWith(
                //                 color: Colors.white
                //             ),),
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 32.0,
                                    backgroundImage: NetworkImage(
                                        getRandomImage()
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Harsh Chauhan",style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0
                                        ),),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text("${Faker().internet.email()}",style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                            fontSize: 12.0
                                        ),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            widget.isUserProfile?getEditProfileWidget():getFollowingWidget()
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10.0),
                        child: getFriendsWidget(),
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top:4.0),
                  child: Container(
                    height: 1.0,
                    color: AppColors.appGreyColor,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        print(index);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: BlogListItem(),
                    );
                  },
                  childCount: 5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getFollowingWidget(){
    return InkWell(
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
      );
  }

  Widget getEditProfileWidget(){
    return InkWell(
      onTap: (){

      },
      child: Container(
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
          child: Text("Edit profile",style: Theme.of(context).textTheme.button?.copyWith(
              color: toggle?Colors.white:Colors.black
          ),),
        ),
      ),
    );
  }

  Widget getFriendsWidget(){
    return Container(
      decoration:BoxDecoration(
        border: Border.all(
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.circular(
          15.0
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            getStatsWidget(getRandomNumber(40,300), "Followers"),
            Container(
              width: 5.0,
              height: 40.0,
              color: AppColors.appGreyColor,
            ),
            getStatsWidget(getRandomNumber(40,300),"Following")
          ],
        ),
      ),
    );
  }


  Widget getStatsWidget(int title,String subtitle){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PeopleScreen()));
      },
      child: Container(
        child: Column(
          children: [
            Text("$title",style: Theme.of(context).textTheme.headline6?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w900
            ),),
            Text(
              "$subtitle",
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: Colors.black38,
                fontWeight: FontWeight.bold
              )
            )
          ],
        ),
      ),
    );
  }


}





