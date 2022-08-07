import 'package:blog_app/config/utils/constants.dart';
import 'package:blog_app/config/utils/util_functions.dart';
import 'package:blog_app/presentation/features/explore/explore_screen.dart';
import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:blog_app/presentation/widgets/custom_safe_area.dart';
import 'package:flutter/material.dart';

import 'create_collection/create_collection_popup.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({Key? key}) : super(key: key);

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> with SingleTickerProviderStateMixin{

  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
          extendBody: false,
          // appBar: AppBar(
          //   leading: null,
          //   automaticallyImplyLeading: false,
          //   title: Text("Collection"),
          //   centerTitle: false,
          //   elevation: 2.0,
          // ),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 70.0),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 130.0,
                  // collapsedHeight: 60.0,
                  elevation: 2.0,
                  automaticallyImplyLeading: false,
                  floating: true,
                  pinned: true,
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
                    preferredSize: Size.fromHeight(48.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top:10.0,left: 10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          labelPadding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 10.0),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    centerTitle: true,
                    background: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Collections",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              )),
                          InkWell(
                            onTap: (){
                              // TODO:- Implement bottom sheet on click of this.
                              showModalBottomSheet(
                                isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
                                  context: context, builder: (context){
                                return CollectionPopup();
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 35.0,
                              width: 90.0,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Text('Create',style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                color: Colors.white
                              ),),
                            ),
                          )
                        ],
                      ),
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
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: collectionItem(),
                      );
                    },
                    childCount: 15,
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget collectionItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        height: 180.0,
        color: AppColors.appGreyColor,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, bottom: 10.0),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${faker.lorem.word()}",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Text(
                            "206 posts",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(
                                    color: Colors.black54, fontSize: 12.0),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "150 writers",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(
                                    color: Colors.black54, fontSize: 12.0),
                          )
                          // Icon(Icons.lock)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                double width = (constraints.maxWidth - 8) / 5;
                print(width);
                return Container(
                  height: 100.0,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                        child: Container(
                          height: 100.0,
                          width: width * 2,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                // image: AssetImage(getRandomImage())
                              image: NetworkImage(getRandomImage())
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 2.0),
                        child: Container(
                          height: 100.0,
                          width: width * 2,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                // image: AssetImage(getRandomImage())
                                image:NetworkImage(getRandomImage())
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 2.0),
                        child: Container(
                          height: 100.0,
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                // image: AssetImage(getRandomImage())
                              image: NetworkImage(getRandomImage())
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
