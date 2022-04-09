import 'package:blog_app/config/utils/constants.dart';
import 'package:blog_app/presentation/features/home/home_bloc.dart';
import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:blog_app/presentation/widgets/blog_list_item.dart';
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

  int _selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: (){

                  },
                  child: ListTile(
                    title: Text("Sign Out"),
                  ),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon:Icon(Icons.menu,color: Colors.black,),
            onPressed: (){
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          title: Text('Home'),
        ),
        body: SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(Globals.S_GOOD_MORNING),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                      itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: index==0?AppColors.primaryColor:Colors.blueGrey[200],
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              "Category",
                              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 100,
                  itemBuilder: (context,index){
                    return BlogListItem();
                  },
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "")
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
}




