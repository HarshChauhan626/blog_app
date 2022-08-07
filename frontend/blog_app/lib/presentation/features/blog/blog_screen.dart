import 'package:blog_app/presentation/features/collection/collection_sheet.dart';
import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';


class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> with TickerProviderStateMixin {


  bool toggle=false;

  bool showBottomBar=true;
  ScrollController? scrollController;

  AnimationController? hideBarAnimationController;


  Tween<double>? varHeight;

  Animation<double>? animatedHeight;

  double percentScrolled=0.0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ScrollDirection? _lastScrollDirection; // <---- Notice the new variable here.
    scrollController = ScrollController();

    hideBarAnimationController=AnimationController(vsync: this,duration: const Duration(milliseconds: 300));
    animatedHeight=Tween<double>(begin: 70.0,end:0.0).animate(CurvedAnimation(parent: hideBarAnimationController!, curve: Curves.linear));

    scrollController?.addListener(() {
      print("Max scroll position is ${scrollController?.position.maxScrollExtent.abs().toString()}");
      print("Min scroll position is ${scrollController?.position.minScrollExtent.abs().toString()}");

      double maxScrollExtent=scrollController!.position.maxScrollExtent.abs();
      double minScrollExtent=scrollController!.position.minScrollExtent.abs();
      double currentScroll=scrollController!.position.pixels.abs();

      setState(() {
        percentScrolled=(currentScroll/maxScrollExtent);
      });

      if(scrollController?.position.userScrollDirection==ScrollDirection.reverse){
        setState(() {
          showBottomBar=false;
          hideBarAnimationController?.forward();
        });
      }
      else{
        setState(() {
          showBottomBar=true;
          hideBarAnimationController?.reverse();
        });
      }
      }
    );
  }


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: getAppBar(),
        body: getBody(),
        bottomNavigationBar:getBottomNavigationBar()
      ),
    );
  }


  PreferredSizeWidget getAppBar(){
    return AppBar(
      elevation: 1.0,
      bottom: PreferredSize(
        preferredSize: Size(double.infinity,3.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 3),
            width: (100.w)*percentScrolled,
            color: Colors.green,
            height: 3.0,
          ),
        ),
      ),
      leading: IconButton(
        icon: Icon(CupertinoIcons.back,color: Colors.black,),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.share_outlined,color: Colors.black,),
          onPressed: (){

          },
        ),
        IconButton(
          icon: Icon(Icons.more_vert,color: Colors.black,),
          onPressed: (){

          },
        )
      ],
    );
  }

  Widget getBody(){
    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.only(top:10.0),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 4.0),
                  child: Text(
                    "Dialog Using GetX in Flutter",
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            CircleAvatar(
                              // child: Image(
                              //   image: AssetImage(
                              //     "assets/car_pic.jpg",
                              //   ),
                              //   fit: BoxFit.fill,
                              // ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("Harsh"),
                            ),
                            InkWell(
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
                            )
                          ],
                        ),
                      ),
                      Text('2 hours ago')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/car_pic.jpg"),
                            fit: BoxFit.fill
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15.0))
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0,vertical:20.0),
                  child: Text('''In the article, I have explained the basic structure of the Dialog Using GetX in a flutter; you can modify this code according to your choice. This was a small introduction to Dialog Using GetX On User Interaction from my side, and it’s working using Flutter.
                        I hope this blog will provide you with sufficient information on Trying up the Dialog Using GetX in your flutter projects. We will show you what the Introduction is?. Make a demo program for working Dialog Using GetX plugins. In this blog, we have examined the Dialog Using GetX of the flutter app. I hope this blog will help you in the comprehension of the Dialog in a better way. So please try it.
                        In the article, I have explained the basic structure of the Dialog Using GetX in a flutter; you can modify this code according to your choice. This was a small introduction to Dialog Using GetX On User Interaction from my side, and it’s working using Flutter.
I hope this blog will provide you with sufficient information on Trying up the Dialog Using GetX in your flutter projects. We will show you what the Introduction is?. Make a demo program for working Dialog Using GetX plugins. In this blog, we have examined the Dialog Using GetX of the flutter app. I hope this blog will help you in the comprehension of the Dialog in a better way. So please try it.
In the article, I have explained the basic structure of the Dialog Using GetX in a flutter; you can modify this code according to your choice. This was a small introduction to Dialog Using GetX On User Interaction from my side, and it’s working using Flutter.
I hope this blog will provide you with sufficient information on Trying up the Dialog Using GetX in your flutter projects. We will show you what the Introduction is?. Make a demo program for working Dialog Using GetX plugins. In this blog, we have examined the Dialog Using GetX of the flutter app. I hope this blog will help you in the comprehension of the Dialog in a better way. So please try it.
In the article, I have explained the basic structure of the Dialog Using GetX in a flutter; you can modify this code according to your choice. This was a small introduction to Dialog Using GetX On User Interaction from my side, and it’s working using Flutter.
I hope this blog will provide you with sufficient information on Trying up the Dialog Using GetX in your flutter projects. We will show you what the Introduction is?. Make a demo program for working Dialog Using GetX plugins. In this blog, we have examined the Dialog Using GetX of the flutter app. I hope this blog will help you in the comprehension of the Dialog in a better way. So please try it.
In the article, I have explained the basic structure of the Dialog Using GetX in a flutter; you can modify this code according to your choice. This was a small introduction to Dialog Using GetX On User Interaction from my side, and it’s working using Flutter.
I hope this blog will provide you with sufficient information on Trying up the Dialog Using GetX in your flutter projects. We will show you what the Introduction is?. Make a demo program for working Dialog Using GetX plugins. In this blog, we have examined the Dialog Using GetX of the flutter app. I hope this blog will help you in the comprehension of the Dialog in a better way. So please try it.
In the article, I have explained the basic structure of the Dialog Using GetX in a flutter; you can modify this code according to your choice. This was a small introduction to Dialog Using GetX On User Interaction from my side, and it’s working using Flutter.
I hope this blog will provide you with sufficient information on Trying up the Dialog Using GetX in your flutter projects. We will show you what the Introduction is?. Make a demo program for working Dialog Using GetX plugins. In this blog, we have examined the Dialog Using GetX of the flutter app. I hope this blog will help you in the comprehension of the Dialog in a better way. So please try it.
In the article, I have explained the basic structure of the Dialog Using GetX in a flutter; you can modify this code according to your choice. This was a small introduction to Dialog Using GetX On User Interaction from my side, and it’s working using Flutter.
I hope this blog will provide you with sufficient information on Trying up the Dialog Using GetX in your flutter projects. We will show you what the Introduction is?. Make a demo program for working Dialog Using GetX plugins. In this blog, we have examined the Dialog Using GetX of the flutter app. I hope this blog will help you in the comprehension of the Dialog in a better way. So please try it.
In the article, I have explained the basic structure of the Dialog Using GetX in a flutter; you can modify this code according to your choice. This was a small introduction to Dialog Using GetX On User Interaction from my side, and it’s working using Flutter.
I hope this blog will provide you with sufficient information on Trying up the Dialog Using GetX in your flutter projects. We will show you what the Introduction is?. Make a demo program for working Dialog Using GetX plugins. In this blog, we have examined the Dialog Using GetX of the flutter app. I hope this blog will help you in the comprehension of the Dialog in a better way. So please try it.
In the article, I have explained the basic structure of the Dialog Using GetX in a flutter; you can modify this code according to your choice. This was a small introduction to Dialog Using GetX On User Interaction from my side, and it’s working using Flutter.
I hope this blog will provide you with sufficient information on Trying up the Dialog Using GetX in your flutter projects. We will show you what the Introduction is?. Make a demo program for working Dialog Using GetX plugins. In this blog, we have examined the Dialog Using GetX of the flutter app. I hope this blog will help you in the comprehension of the Dialog in a better way. So please try it.
In the article, I have explained the basic structure of the Dialog Using GetX in a flutter; you can modify this code according to your choice. This was a small introduction to Dialog Using GetX On User Interaction from my side, and it’s working using Flutter.
I hope this blog will provide you with sufficient information on Trying up the Dialog Using GetX in your flutter projects. We will show you what the Introduction is?. Make a demo program for working Dialog Using GetX plugins. In this blog, we have examined the Dialog Using GetX of the flutter app. I hope this blog will help you in the comprehension of the Dialog in a better way. So please try it.
In the article, I have explained the basic structure of the Dialog Using GetX in a flutter; you can modify this code according to your choice. This was a small introduction to Dialog Using GetX On User Interaction from my side, and it’s working using Flutter.
I hope this blog will provide you with sufficient information on Trying up the Dialog Using GetX in your flutter projects. We will show you what the Introduction is?. Make a demo program for working Dialog Using GetX plugins. In this blog, we have examined the Dialog Using GetX of the flutter app. I hope this blog will help you in the comprehension of the Dialog in a better way. So please try it.
In the article, I have explained the basic structure of the Dialog Using GetX in a flutter; you can modify this code according to your choice. This was a small introduction to Dialog Using GetX On User Interaction from my side, and it’s working using Flutter.
I hope this blog will provide you with sufficient information on Trying up the Dialog Using GetX in your flutter projects. We will show you what the Introduction is?. Make a demo program for working Dialog Using GetX plugins. In this blog, we have examined the Dialog Using GetX of the flutter app. I hope this blog will help you in the comprehension of the Dialog in a better way. So please try it.
In the article, I have explained the basic structure of the Dialog Using GetX in a flutter; you can modify this code according to your choice. This was a small introduction to Dialog Using GetX On User Interaction from my side, and it’s working using Flutter.
I hope this blog will provide you with sufficient information on Trying up the Dialog Using GetX in your flutter projects. We will show you what the Introduction is?. Make a demo program for working Dialog Using GetX plugins. In this blog, we have examined the Dialog Using GetX of the flutter app. I hope this blog will help you in the comprehension of the Dialog in a better way. So please try it.
In the article, I have explained the basic structure of the Dialog Using GetX in a flutter; you can modify this code according to your choice. This was a small introduction to Dialog Using GetX On User Interaction from my side, and it’s working using Flutter.
I hope this blog will provide you with sufficient information on Trying up the Dialog Using GetX in your flutter projects. We will show you what the Introduction is?. Make a demo program for working Dialog Using GetX plugins. In this blog, we have examined the Dialog Using GetX of the flutter app. I hope this blog will help you in the comprehension of the Dialog in a better way. So please try it.
In the article, I have explained the basic structure of the Dialog Using GetX in a flutter; you can modify this code according to your choice. This was a small introduction to Dialog Using GetX On User Interaction from my side, and it’s working using Flutter.
I hope this blog will provide you with sufficient information on Trying up the Dialog Using GetX in your flutter projects. We will show you what the Introduction is?. Make a demo program for working Dialog Using GetX plugins. In this blog, we have examined the Dialog Using GetX of the flutter app. I hope this blog will help you in the comprehension of the Dialog in a better way. So please try it.
In the article, I have explained the basic structure of the Dialog Using GetX in a flutter; you can modify this code according to your choice. This was a small introduction to Dialog Using GetX On User Interaction from my side, and it’s working using Flutter.
I hope this blog will provide you with sufficient information on Trying up the Dialog Using GetX in your flutter projects. We will show you what the Introduction is?. Make a demo program for working Dialog Using GetX plugins. In this blog, we have examined the Dialog Using GetX of the flutter app. I hope this blog will help you in the comprehension of the Dialog in a better way. So please try it.                    
                        '''),
                )
              ],
            )
          ],
        ),
      ),
    );
  }


  Widget getBottomNavigationBar(){
    return  AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: showBottomBar?60.0:0.0,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.30),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.thumb_up_alt_outlined),
            onPressed: (){

            },
          ),
          IconButton(
            icon: Icon(Icons.mode_comment_outlined),
            onPressed: (){

            },
          ),
          IconButton(
            icon:Icon(Icons.bookmark_border),
            onPressed: (){
              showModalBottomSheet(context: context, builder: (context){
                return CollectionSheet();
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.headset),
            onPressed: (){},
          )
        ],
      ),
    );
  }


}





