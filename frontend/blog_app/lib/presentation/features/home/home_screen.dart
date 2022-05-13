import 'package:blog_app/config/utils/constants.dart';
import 'package:blog_app/presentation/features/home/home_bloc.dart';
import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:blog_app/presentation/widgets/blog_list_item.dart';
import 'package:blog_app/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(

        ),
        child: HomeScreen(),
      ),
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;

  double borderRadius = 100.0;

  PageController? _pageController;

  int activePageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getAppBar(),
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

        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Text(
                    'Thursday, May 12th',
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
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Text(Globals.S_GOOD_MORNING, style: Theme
                    .of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(
                  color: Colors.black,
                )
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Harsh", style: Theme
                    .of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(
                  color: Colors.black,
                )
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Center(child: getTabBar())
              ),
              Container(
                height: 560.0,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      activePageIndex = index;
                    });
                  },
                  children: [
                    getListView(),
                    getListView(),
                    getListView()
                  ],
                ),
              )
            ],
          ),
        ),
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

      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  Widget getTabBar() {
    return Container(
      width: 370.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: AppColors.appGreyColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              onTap: () {
                setState(() {
                  activePageIndex = 0;
                  _pageController?.animateToPage(0,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.decelerate);
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                padding: EdgeInsets.symmetric(vertical: 2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: (activePageIndex == 0)
                      ? AppColors.primaryColor
                      : AppColors.appGreyColor,
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                ),
                child: Text(
                  "For You",
                  style: (activePageIndex == 0)
                      ? TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)
                      : TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              onTap: () {
                setState(() {
                  activePageIndex = 1;
                  _pageController?.animateToPage(1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.decelerate);
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                padding: EdgeInsets.symmetric(vertical: 2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: (activePageIndex == 1)
                      ? AppColors.primaryColor
                      : AppColors.appGreyColor,
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                ),
                child: Text(
                  "Latest",
                  style: (activePageIndex == 1)
                      ? TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)
                      : TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              onTap: () {
                setState(() {
                  activePageIndex = 2;
                  _pageController?.animateToPage(2,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.decelerate);
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                padding: EdgeInsets.symmetric(vertical: 2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: (activePageIndex == 2)
                      ? AppColors.primaryColor
                      : AppColors.appGreyColor,
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                ),
                child: Text(
                  "Following",
                  style: (activePageIndex == 2)
                      ? TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)
                      : TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget getListView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: 100,
        itemBuilder: (context, index) {
          return BlogListItem();
        },
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      // leading: IconButton(
      //   icon:Icon(Icons.menu,color: Colors.black,),
      //   onPressed: (){
      //     _scaffoldKey.currentState?.openDrawer();
      //   },
      // ),
      automaticallyImplyLeading: false,
      title: Text('Blogger', style: Theme
          .of(context)
          .textTheme
          .headline5
          ?.copyWith(
          fontWeight: FontWeight.bold
      ),),
      centerTitle: true,
    );
  }

}