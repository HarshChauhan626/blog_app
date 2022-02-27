import 'package:blog_app/config/dio_client.dart';
import 'package:blog_app/data/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
final instance = GetIt.instance;

Future<void> initModule() async {
  instance.registerLazySingleton<DioClient>(() => DioClient());
  instance.registerLazySingleton<NetworkInfoImpl>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
}

void resetModule() {
  instance.reset(dispose: true);
}
