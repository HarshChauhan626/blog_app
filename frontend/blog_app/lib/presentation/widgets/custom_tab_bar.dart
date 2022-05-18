import 'package:blog_app/presentation/features/home/home_bloc.dart';
import 'package:blog_app/presentation/features/home/home_event.dart';
import 'package:blog_app/presentation/features/home/home_state.dart';
import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.0,
      height: 40.0,
      // decoration: BoxDecoration(
      //   color: AppColors.appGreyColor,
      //   borderRadius: BorderRadius.all(Radius.circular(100)),
      // ),
      // // child: Row(
      // //   children: <Widget>[
      // //     Expanded(
      // //       child: InkWell(
      // //         borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      // //         onTap: () {
      // //           setState(() {
      // //             activePageIndex = 0;
      // //             _pageController?.animateToPage(0,
      // //                 duration: const Duration(milliseconds: 400),
      // //                 curve: Curves.decelerate);
      // //           });
      // //         },
      // //         child: AnimatedContainer(
      // //           duration: Duration(milliseconds: 400),
      // //           padding: EdgeInsets.symmetric(vertical: 2),
      // //           alignment: Alignment.center,
      // //           decoration: BoxDecoration(
      // //             color: (activePageIndex == 0)
      // //                 ? AppColors.primaryColor
      // //                 : AppColors.appGreyColor,
      // //             borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      // //           ),
      // //           child: Text(
      // //             "For You",
      // //             style: (activePageIndex == 0)
      // //                 ? TextStyle(
      // //                 color: Colors.white, fontWeight: FontWeight.bold)
      // //                 : TextStyle(
      // //                 color: Colors.black, fontWeight: FontWeight.bold),
      // //           ),
      // //         ),
      // //       ),
      // //     ),
      // //     Expanded(
      // //       child: InkWell(
      // //         borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      // //         onTap: () {
      // //           setState(() {
      // //             activePageIndex = 1;
      // //             _pageController?.animateToPage(1,
      // //                 duration: const Duration(milliseconds: 400),
      // //                 curve: Curves.decelerate);
      // //           });
      // //         },
      // //         child: AnimatedContainer(
      // //           duration: Duration(milliseconds: 400),
      // //           padding: EdgeInsets.symmetric(vertical: 2),
      // //           alignment: Alignment.center,
      // //           decoration: BoxDecoration(
      // //             color: (activePageIndex == 1)
      // //                 ? AppColors.primaryColor
      // //                 : AppColors.appGreyColor,
      // //             borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      // //           ),
      // //           child: Text(
      // //             "Latest",
      // //             style: (activePageIndex == 1)
      // //                 ? TextStyle(
      // //                 color: Colors.white, fontWeight: FontWeight.bold)
      // //                 : TextStyle(
      // //                 color: Colors.black, fontWeight: FontWeight.bold),
      // //           ),
      // //         ),
      // //       ),
      // //     ),
      // //     Expanded(
      // //       child: InkWell(
      // //         borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      // //         onTap: () {
      // //           setState(() {
      // //             activePageIndex = 2;
      // //             _pageController?.animateToPage(2,
      // //                 duration: const Duration(milliseconds: 400),
      // //                 curve: Curves.decelerate);
      // //           });
      // //         },
      // //         child: AnimatedContainer(
      // //           duration: Duration(milliseconds: 400),
      // //           padding: EdgeInsets.symmetric(vertical: 2),
      // //           alignment: Alignment.center,
      // //           decoration: BoxDecoration(
      // //             color: (activePageIndex == 2)
      // //                 ? AppColors.primaryColor
      // //                 : AppColors.appGreyColor,
      // //             borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      // //           ),
      // //           child: Text(
      // //             "Following",
      // //             style: (activePageIndex == 2)
      // //                 ? TextStyle(
      // //                 color: Colors.white, fontWeight: FontWeight.bold)
      // //                 : TextStyle(
      // //                 color: Colors.black, fontWeight: FontWeight.bold),
      // //           ),
      // //         ),
      // //       ),
      // //     ),
      // //   ],
      // // ),
      // child: Row(
      //   children: [
      //     Container(
      //
      //     )
      //   ],
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          getTabWidget(0,'Daily read', context),
          SizedBox(
            width: 25,
          ),
          getTabWidget(1, "Following",context),
          SizedBox(
            width: 25,
          ),
          getTabWidget(2, "Trending",context),
        ],
      ),
    );
  }


  Widget getTabWidget(int index,String title, BuildContext context) {
    return InkWell(
        onTap: () {
          print('On tap clicked');
          // BlocProvider.of<HomeBloc>(context).tabChanged(index);
          BlocProvider.of<HomeBloc>(context).add(
            HomeTabChanged(index)
          );
        },
        // child: BlocBuilder<WeatherInfoCubit,WeatherInfoState>(
        //     builder:(context,state){
        //       int selectedIndex=state.selectedIndex??0;
        //       print(state.selectedIndex);
        //       ;
        //     }
        // ),
        child: BlocConsumer<HomeBloc,HomeState>(
          builder: (context,state){
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: index == state.activePageIndex?Colors.black:AppColors.greyColor,
                        fontSize: index == state.activePageIndex?20.0:18.0
                      )),
                  AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      height: index == state.activePageIndex ? 5 : 0,
                      width: index == state.activePageIndex ? 20 : 0,
                      decoration: BoxDecoration(
                          color: index == state.activePageIndex
                              ? AppColors.primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))))
                ],
              ),
            );
          }, listener: (BuildContext context, Object? state) {

        },
        )
    );
  }

}




