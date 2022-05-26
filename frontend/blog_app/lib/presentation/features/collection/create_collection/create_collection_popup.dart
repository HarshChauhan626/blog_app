import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';


class CollectionPopup extends StatefulWidget {
  const CollectionPopup({Key? key}) : super(key: key);

  @override
  State<CollectionPopup> createState() => _CollectionPopupState();
}

class _CollectionPopupState extends State<CollectionPopup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0)
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            alignment: Alignment.center,
            height: 40.0,
            width: double.infinity,
            padding: const EdgeInsets.only(bottom:10.0),
            decoration: BoxDecoration(
              border: Border(
                bottom:BorderSide(
                    color: AppColors.appGreyColor,
                    width: 4.0
                )
              )
            ),
            child: Text('Create Collection',style: Theme.of(context).textTheme.headline6,),
          ),
          Padding(
            // padding: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Name"
              ),
            ),
          ),
          Padding(
            // padding: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText:"Description(Optional)"
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Private"),
                    Text('Only you can see that')
                  ],
                ),
                Switch(
                  value: true,
                  onChanged: (val){
                    print(val);
                  },
                )
              ],
            ),
          ),
          Padding(
            // padding: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200.0,40.0)
              ),
              onPressed: (){},
              child: Center(
                child: Text("Create"),
              ),
            ),
          )
        ],
      ),
    );
  }
}






