import 'package:flutter/material.dart';

class CollectionSheet extends StatelessWidget {
  const CollectionSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool value=false;

    return Container(
      height: 450.0,
        child:SingleChildScrollView(
          child: Column(
            children: [
              for(int i=0;i<10;i++)
                Row(
                  children: [
                    Checkbox(value: value, onChanged: (value){
                      value=value;
                    }),
                    Text("Collection name")
                  ],
                ),
            ],
          ),
        )
    );
  }
}





