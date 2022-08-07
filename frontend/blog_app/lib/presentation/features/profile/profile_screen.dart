import 'package:blog_app/data/datasources/local/fake_data_service.dart';
import 'package:blog_app/presentation/features/profile/profile_bloc.dart';
import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:blog_app/presentation/widgets/custom_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(

        ),
        child: ProfileScreen(),
      ),
    );
  }

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: null,
          centerTitle: true,
          title: Text("Account"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Stack(
                        children: const [
                          CircleAvatar(
                          radius: 40.0,
                            // child: Icon(Icons.person_outline),
                            backgroundImage: AssetImage("assets/robertdowney.jpg"),
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                      child: Row(
                        children: [
                          Text(instance<FakeDataSource>().fakeName,style: Theme.of(context).textTheme.headline5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            // child: Container(
                            //   alignment: Alignment.center,
                            //   height: 30.0,
                            //   width: 30.0,
                            //   decoration: BoxDecoration(
                            //     border: Border.all(
                            //       color: Colors.black,
                            //       width: 1.0
                            //     ),
                            //     borderRadius: BorderRadius.all(Radius.circular(10.0))
                            //   ),
                            //   child: IconButton(
                            //     icon: Container(
                            //       alignment: Alignment.center,
                            //         child: Icon(Icons.edit_outlined,size: 17.0,)
                            //     ),
                            //     onPressed: (){
                            //
                            //     },
                            //   ),
                            // ),
                            child: IconButton(
                              icon: Container(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.edit_outlined)
                              ),
                              onPressed: (){

                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spac,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.email),
                          SizedBox(
                            width: 4.0,
                          ),
                          Text("harshchauhan5180@gmail.com",style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.normal,color: Colors.grey),)
                        ],
                      ),
                    )
                  ],),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    getRowWidget("100","Followers"),
                    getRowWidget("100","Followers"),
                    getRowWidget("100","Followers"),
                  ],
                ),
              ),
              Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Stories'),
                    trailing: Icon(Icons.navigate_next),
                    onTap: (){

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Stories'),
                    trailing: Icon(Icons.navigate_next),
                    onTap: (){

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Stories'),
                    trailing: Icon(Icons.navigate_next),
                    onTap: (){

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Stories'),
                    trailing: Icon(Icons.navigate_next),
                    onTap: (){

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Stories'),
                    trailing: Icon(Icons.navigate_next),
                    onTap: (){

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Stories'),
                    trailing: Icon(Icons.navigate_next),
                    onTap: (){

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Stories'),
                    trailing: Icon(Icons.navigate_next),
                    onTap: (){

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Stories'),
                    trailing: Icon(Icons.navigate_next),
                    onTap: (){

                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget getRowWidget(String title,String subtitle){
    return SizedBox(
      height: 50.0,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: Theme.of(context).textTheme.headline6?.copyWith(
            fontWeight: FontWeight.bold
          ),),
          Text(subtitle,style: Theme.of(context).textTheme.subtitle1?.copyWith(
            color: AppColors.greyColor,
            fontWeight: FontWeight.bold
          ),)
        ],
      ),
    );
  }


}



