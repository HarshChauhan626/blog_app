import 'package:blog_app/config/utils/constants.dart';
import 'package:blog_app/config/utils/secure_storage.dart';
import 'package:blog_app/data/datasources/local/fake_data_service.dart';
import 'package:blog_app/presentation/features/home/home_bloc.dart';
import 'package:blog_app/presentation/features/home/home_state.dart';
import 'package:blog_app/presentation/features/notification/notification_screen.dart';
import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:blog_app/presentation/widgets/blog_list_item.dart';
import 'package:blog_app/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:blog_app/presentation/widgets/custom_safe_area.dart';
import 'package:blog_app/presentation/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => BlocProvider<HomeBloc>(
        create: (context) => instance<HomeBloc>(),
        child: HomeScreen(),
      ),
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  double borderRadius = 100.0;


  int activePageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        // appBar: getAppBar(),
        // drawer: Drawer(
        //   child: SingleChildScrollView(
        //     physics: AlwaysScrollableScrollPhysics(),
        //     child: Column(
        //       children: [
        //         InkWell(
        //           onTap: (){
        //
        //           },
        //           child: ListTile(
        //             title: Text("Sign Out"),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        // body: SingleChildScrollView(
        //   physics: AlwaysScrollableScrollPhysics(),
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       SizedBox(
        //         height: 20.0,
        //       ),
        //       Row(
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(left:20.0),
        //             child: Container(
        //               alignment: Alignment.center,
        //               child: Stack(
        //                 children: const [
        //                   CircleAvatar(
        //                     radius: 25.0,
        //                     // child: Icon(Icons.person_outline),
        //                     backgroundImage: AssetImage("assets/robertdowney.jpg"),
        //                   )
        //                 ],
        //               ),
        //             ),
        //           ),
        //           Container(
        //             alignment: Alignment.centerLeft,
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Padding(
        //                   padding: const EdgeInsets.only(left:20.0,bottom: 3.0,top: 4.0),
        //                   child: Text(
        //                       "${Globals.S_GOOD_MORNING}",
        //                       style: Theme
        //                           .of(context)
        //                           .textTheme
        //                           .subtitle2
        //                           ?.copyWith(
        //                         color: Colors.grey,
        //                       )
        //                   ),
        //                 ),
        //                 Padding(
        //                   padding: const EdgeInsets.only(left:20.0,bottom:10.0),
        //                   child: Text("Harsh Chauhan", style: Theme
        //                       .of(context)
        //                       .textTheme
        //                       .headline5
        //                       ?.copyWith(
        //                     color: Colors.black,
        //                   )
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //           Spacer(),
        //           Padding(
        //             padding: const EdgeInsets.only(right:20.0),
        //             child: Container(
        //               height: 30.0,
        //               width: 30.0,
        //               decoration: BoxDecoration(
        //                 color: AppColors.appGreyColor,
        //                 borderRadius: BorderRadius.circular(10.0)
        //               ),
        //               child: Icon(Icons.notifications_none),
        //             ),
        //           )
        //         ],
        //       ),
        //       // Padding(
        //       //   padding: const EdgeInsets.only(left: 20.0,bottom: 10.0),
        //       //   child: Text("Harsh", style: Theme
        //       //       .of(context)
        //       //       .textTheme
        //       //       .headline5
        //       //       ?.copyWith(
        //       //     color: Colors.black,
        //       //   )
        //       //   ),
        //       // ),
        //       SizedBox(
        //         height: 20.0,
        //       ),
        //       Padding(
        //           padding: const EdgeInsets.symmetric(
        //               horizontal: 8.0, vertical: 4.0),
        //           child: Center(child: getTabBar())
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.only(top:8.0),
        //         child: Container(
        //           height: 560.0,
        //           child: PageView(
        //             controller: _pageController,
        //             onPageChanged: (int index) {
        //               setState(() {
        //                 activePageIndex = index;
        //               });
        //             },
        //             children: [
        //               getListView(),
        //               getListView(),
        //               getListView()
        //             ],
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        // bottomNavigationBar: BottomNavigationBar(
        //   landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        //   currentIndex: _selectedIndex, //New
        //   onTap: _onItemTapped,
        //   items: const [
        //     BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
        //     BottomNavigationBarItem(icon: Icon(Icons.search),label: ""),
        //     BottomNavigationBarItem(icon: Icon(Icons.person),label: "")
        //   ],
        // ),
        body: Padding(
          padding: const EdgeInsets.only(bottom:70.0),
          child: CustomScrollView(
            slivers: [
              getAppBar(),
              getListView()
              // SizedBox(
              //   height: 40.0,
              // )
            ],
          ),
        ),

      ),
    );
  }

  Widget getListView() {
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
    //   child: ListView.builder(
    //     shrinkWrap: true,
    //     physics: AlwaysScrollableScrollPhysics(),
    //     itemCount: 100,
    //     itemBuilder: (context, index) {
    //       return BlogListItem();
    //     },
    //   ),
    // );
    return BlocConsumer<HomeBloc,HomeState>(

      listener: (BuildContext context, state) {

      },
      builder: (BuildContext context, Object? state) {

        if(state is HomeLoadingState){
          return SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        else if(state is HomeLoadedState)
          {
            print(state);
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context,index){
                  print("Length of list coming in bloc is ${state.blogListEntity!.blogEntityList.length}");
                  print("Blog coming is ${state.blogListEntity!.blogEntityList[index]}");

                  final blog=state.blogListEntity!.blogEntityList[index];

                  print(blog.toJson().toString());

                  print("Blog coming not null ${blog!=null}");

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0),
                    child: BlogListItem(blog:blog),
                  );
                },
                childCount:state.blogListEntity!.blogEntityList.length,
              ),
            );
        }
        else if(state is HomeErrorState){
          return SliverFillRemaining(
            child: Center(child: Text("Something went wrong")),
          );
        }
        else{
          return SliverFillRemaining(
            child: Center(child: Text("Something went wrong")),
          );
        }
      },
    );
  }

  Widget getAppBar() {
    // return AppBar(
    //   // leading: IconButton(
    //   //   icon:Icon(Icons.menu,color: Colors.black,),
    //   //   onPressed: (){
    //   //     _scaffoldKey.currentState?.openDrawer();
    //   //   },
    //   // ),
    //   leading: null,
    //   automaticallyImplyLeading: false,
    //   title: Text('Blogger', style: Theme
    //       .of(context)
    //       .textTheme
    //       .headline5
    //       ?.copyWith(
    //       fontWeight: FontWeight.bold
    //   ),
    //   ),
    //   centerTitle: true,
    // );
    return
      SliverAppBar(
        expandedHeight: 180.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.white),
        floating: true,
        pinned: true,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize:  Size.fromHeight(60.0),
          child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 4.0),
              child: Container(
                  color: Colors.white,
                  child: Center(child: CustomTabBar())
              )
          ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          centerTitle: true,
          background: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Stack(
                        children: const [
                          CircleAvatar(
                            radius: 25.0,
                            // child: Icon(Icons.person_outline),
                            // backgroundImage: AssetImage("assets/robertdowney.jpg"),
                            backgroundImage: NetworkImage(
                                "https://picsum.photos/200/300"
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:20.0,bottom: 3.0,top: 4.0),
                          child: Text(
                              Globals.S_GOOD_MORNING,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(
                                color: Colors.grey,
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:20.0,bottom:10.0),
                          child: Text(instance<FakeDataSource>().fakeName, style: Theme
                              .of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(
                            color: Colors.black,
                          )
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right:20.0,bottom: 5.0),
                    child: GestureDetector(
                      onTap: (){
                        debugPrint("Notification icon tapped");
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>NotificationScreen()));
                      },
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          // color: Colors.red,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Colors.black26
                            )
                        ),
                        child: Icon(Icons.notifications_none),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
  }


}




