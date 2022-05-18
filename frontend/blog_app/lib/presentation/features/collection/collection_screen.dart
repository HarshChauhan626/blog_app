import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';


class CollectionScreen extends StatefulWidget {
  const CollectionScreen({Key? key}) : super(key: key);

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: false,
        appBar: AppBar(
          leading: null,
          automaticallyImplyLeading: false,
          title: Text("Collection"),
          centerTitle: false,
          elevation: 2.0,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.only(bottom:60.0),
          itemCount: 10,
            itemBuilder: (context,index){
          return collectionItem();
        }),
      ),
    );
  }


  Widget collectionItem(){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        child: Container(
          height: 180.0,
          color: AppColors.appGreyColor,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:20.0,left: 20.0,bottom: 10.0),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Reading list",style: Theme.of(context).textTheme.headline6,),
                      Row(
                        children: [
                          Text("206 posts",style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: Colors.black54
                          ),),
                          SizedBox(
                            width: 10.0,
                          ),
                          Icon(Icons.lock)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              LayoutBuilder(
                builder: (context,constraints){
                  double width=(constraints.maxWidth-8)/5;
                  print(width);
                  return Container(
                    height: 100.0,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:2.0,right: 2.0),
                          child: Container(
                            height: 100.0,
                            width:width*2,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              image:DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/car_pic.jpg"
                                  )
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:2.0),
                          child: Container(
                            height: 100.0,
                            width:width*2,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              image:DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/tomcruise.jfif"
                                  )
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:2.0),
                          child: Container(
                            height: 100.0,
                            width:width,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              image:DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/robertdowney.jpg"
                                  )
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





