import 'package:blog_app/domain/repositories/blog_repository.dart';
import 'package:blog_app/presentation/features/onboarding/onboarding.dart';
import 'package:blog_app/presentation/resources/app_theme.dart';
import 'package:blog_app/domain/repositories/user_repository.dart';
import 'package:blog_app/presentation/features/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'di.dart';
import 'presentation/features/authentication/authentication.dart';
import 'presentation/resources/custom_router.dart';

import 'di.dart' as service_locator;

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await initModule();

  BlocOverrides.runZoned(
    () => runApp(
      BlocProvider(create: (context)=>AuthenticationBloc()..add(AppStarted()),
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<BlogRepository>(create: (context)=>instance()),
          RepositoryProvider<UserRepository>(create: (context)=>instance())
        ],
        child: const MyApp(),
      ),
      )
    ),
    blocObserver: SimpleBlocDelegate(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          title: "Blog App",
          onGenerateRoute: CustomRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
        );
      },
    );
  }
}
