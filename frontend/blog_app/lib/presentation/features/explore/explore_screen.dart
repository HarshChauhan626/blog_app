import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'explore_bloc.dart';


class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  static const String routeName = '/explore';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => BlocProvider<ExploreBloc>(
        create: (context) => ExploreBloc(

        ),
        child: ExploreScreen(),
      ),
    );
  }

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            
          ),
        ),
      ),
    );
  }
}




