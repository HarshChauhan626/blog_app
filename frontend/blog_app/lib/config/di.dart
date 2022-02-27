import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
final instance = GetIt.instance;

Future<void> initModule() async {
  instance.registerLazySingleton<DioClient>(() => DioClient());
  instance
      .registerLazySingleton<LocalStorageService>(() => LocalStorageService());
  instance.registerLazySingleton<ApiService>(() => ApiService(instance()));
  instance.registerLazySingleton<WeatherRepositoryImpl>(
      () => WeatherRepositoryImpl(instance()));
  instance
      .registerFactory<GetWeatherUseCase>(() => GetWeatherUseCase(instance()));
  instance
      .registerFactory<WeatherInfoCubit>(() => WeatherInfoCubit(instance()));
  instance.registerFactory<SearchInfoCubit>(() => SearchInfoCubit());
  instance.registerLazySingleton<NetworkInfoImpl>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
}

void resetModule() {
  instance.reset(dispose: true);
}
