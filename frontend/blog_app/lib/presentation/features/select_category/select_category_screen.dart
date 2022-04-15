import 'package:flutter/material.dart';


class SelectCategoryScreen extends StatefulWidget {
  const SelectCategoryScreen({Key? key}) : super(key: key);

  static const String routeName = '/select_category';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => SelectCategoryScreen(),
    );
  }

  @override
  State<SelectCategoryScreen> createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<SelectCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          children: [
            for(int i=0;i<30;i++)
              categoryChip("Anime")
          ],
        )
      ],
    );
  }


  Widget categoryChip(String category){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chip(label: Text(category)),
    );
  }


}



