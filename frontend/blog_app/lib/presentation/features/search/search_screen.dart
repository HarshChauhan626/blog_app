import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:blog_app/presentation/widgets/custom_safe_area.dart';
import 'package:blog_app/presentation/widgets/custom_tab_bar.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {

  TextEditingController? _textEditingController;
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController=TextEditingController();
    tabController=TabController(length: 4, vsync:this);
  }


  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        // body: CustomScrollView(
        //   slivers: [
        //     SliverAppBar(
        //       automaticallyImplyLeading: false,
        //       expandedHeight: 180.0,
        //       backgroundColor: Colors.white,
        //       // elevation: 100.0,
        //       // bottom: PreferredSize(
        //       //   preferredSize: Size.fromHeight(100.0), child: Container(
        //       //   height: 100.0,
        //       //   child: Row(
        //       //     children: [
        //       //       Container(
        //       //         // height: 45.0,
        //       //         // margin: const EdgeInsets.symmetric(vertical: 30),
        //       //         width: 300.0,
        //       //         padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
        //       //         decoration: BoxDecoration(
        //       //             color: AppColors.appGreyColor,
        //       //             borderRadius: BorderRadius.circular(15.0)
        //       //         ),
        //       //         child: TextField(
        //       //           controller: _textEditingController,
        //       //           onTap: (){
        //       //             Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchScreen()));
        //       //           },
        //       //           decoration: InputDecoration(
        //       //               filled: true,
        //       //               fillColor: AppColors.appGreyColor,
        //       //               // focusColor: AppColors.greyColor,
        //       //               // hoverColor: AppColors.appGreyColor,
        //       //               // focusedBorder: OutlineInputBorder(
        //       //               //     borderSide: BorderSide(color: AppColors.primaryColor),
        //       //               //     borderRadius: BorderRadius.all(Radius.circular(15))),
        //       //               // border: OutlineInputBorder(
        //       //               //     borderSide: BorderSide(color: Colors.white),
        //       //               //     borderRadius: BorderRadius.all(Radius.circular(15))
        //       //               // ),
        //       //               border: InputBorder.none,
        //       //               prefixIcon: Icon(
        //       //                 Icons.search,
        //       //                 color: AppColors.primaryColor,
        //       //               )),
        //       //         ),
        //       //       )
        //       //     ],
        //       //   ),
        //       // ),
        //       // ),
        //       flexibleSpace: FlexibleSpaceBar(
        //         // collapseMode: CollapseMode.pin,
        //         // centerTitle: true,
        //         background: Container(
        //           height: 100.0,
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.symmetric(horizontal:20.0),
        //                 child: Container(
        //                   // height: 45.0,
        //                   // margin: const EdgeInsets.symmetric(vertical: 30),
        //                   width:370.0,
        //                   padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
        //                   decoration: BoxDecoration(
        //                       color: AppColors.appGreyColor,
        //                       borderRadius: BorderRadius.circular(15.0)
        //                   ),
        //                   child: TextField(
        //                     controller: _textEditingController,
        //                     onTap: (){
        //                       // Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchScreen()));
        //                     },
        //                     decoration: InputDecoration(
        //                         filled: true,
        //                         fillColor: AppColors.appGreyColor,
        //                         // focusColor: AppColors.greyColor,
        //                         // hoverColor: AppColors.appGreyColor,
        //                         // focusedBorder: OutlineInputBorder(
        //                         //     borderSide: BorderSide(color: AppColors.primaryColor),
        //                         //     borderRadius: BorderRadius.all(Radius.circular(15))),
        //                         // border: OutlineInputBorder(
        //                         //     borderSide: BorderSide(color: Colors.white),
        //                         //     borderRadius: BorderRadius.all(Radius.circular(15))
        //                         // ),
        //                         border: InputBorder.none,
        //                         prefixIcon: Icon(
        //                           Icons.search,
        //                           color: AppColors.primaryColor,
        //                         )),
        //                   ),
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //
        //   ],
        // ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width:370.0,
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                  decoration: BoxDecoration(

                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: TextField(
                    controller: _textEditingController,
                    autofocus: true,
                    onChanged: (text) {
                      setState(() {

                      });
                    },
                    decoration: InputDecoration(
                      hintStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: AppColors.greyColor
                      ),
                      // contentPadding: EdgeInsets.only(top: 0, left: 25),
                      prefixIcon: InkWell(
                        onTap: (){
                        },
                          child: Icon(Icons.search)
                      ),
                      suffixIcon:_textEditingController!.text.isEmpty
                          ? null
                          : InkWell(
                        onTap: (){
                          _textEditingController!.clear();
                          setState(() {

                          });
                        },
                        child: Icon(Icons.clear),
                      ),
                      filled: true,
                      fillColor: AppColors.appGreyColor,
                      hintText: 'Search Blogger',
                      // border: InputBorder.none,
                      border: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _textEditingController!.text.isNotEmpty?recentSearchView():noRecentSearchView()
            ],
          ),
        ),
      ),
    );
  }


  Widget getTabBar(){
    return Column(
      children:  [
        TabBar(
          // padding: const EdgeInsets.all(3.0),
          // indicatorPadding: const EdgeInsets.only(top: 10.0),
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: AppColors.primaryColor,
          // indicatorPadding: const EdgeInsets.only(right: 30.0,left:30.0),
          tabs: [
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: Text('People',style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontSize: 14.0
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: Text('Blogs',style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontSize: 14.0
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: Text('Collection',style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontSize: 14.0
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: Text('Tags',style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontSize: 14.0
              ),),
            )
          ],
        )
      ],
    );
  }

  Widget recentSearchView(){
    return Container(
      child: Column(
        children: [
          1==0?getTabBar():recentSearchList()
        ],
      ),
    );
  }

  Widget recentSearchList(){
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent searches'),
                InkWell(
                  child: Text("Clear all",style: Theme.of(context).textTheme.button?.copyWith(
                    color: AppColors.primaryColor
                  ),),
                )
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
              itemBuilder: (context,index){
            return recentSearchItem();
          })
        ],
      ),
    );
  }

  Widget noRecentSearchView(){
    return SizedBox(
      height: 310.0,
      child: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          Container(
            height: 200.0,
            child: SvgPicture.asset("assets/searching.svg"),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: Text("What are you searching for?",style: Theme.of(context).textTheme.headline5,),
          ),
          Padding(
            padding: const EdgeInsets.only(top:4.0),
            child: Text("Search for author,blogs or tags",style: Theme.of(context).textTheme.headline6?.copyWith(
                color: AppColors.greyColor,
                fontWeight: FontWeight.normal
            ),),
          )
        ],
      ),
    );
  }

  Widget recentSearchItem(){
    var faker=Faker();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(faker.lorem.word(),
          style: Theme.of(context).textTheme.headline6,),
          IconButton(icon: Icon(Icons.clear),onPressed: (){

          },)
        ],
      ),
    );
  }


}






