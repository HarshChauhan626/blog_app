import 'package:blog_app/config/utils/shared_preferences.dart';
import 'package:blog_app/data/datasources/local/fake_data_service.dart';
import 'package:blog_app/data/datasources/local/local_storage_service.dart';
import 'package:blog_app/data/datasources/remote/remote_data_source.dart';
import 'package:blog_app/data/network/app_api.dart';
import 'package:blog_app/data/network/dio_factory.dart';
import 'package:blog_app/data/network/network_info.dart';
import 'package:blog_app/data/repositories/blog_repository_impl.dart';
import 'package:blog_app/data/repositories/user_repository_impl.dart';
import 'package:blog_app/domain/repositories/blog_repository.dart';
import 'package:blog_app/domain/repositories/user_repository.dart';
import 'package:faker/faker.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
final instance = GetIt.instance;

Future<void> initModule() async {
  instance.registerLazySingleton<NetworkInfoImpl>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  instance.registerLazySingleton<SharedPreference>(() => SharedPreference());

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  // app  service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  instance.registerLazySingleton<Faker>(() => Faker());


  instance.registerLazySingleton<FakeDataSource>(() => FakeDataSourceImpl(instance()));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImplementer(instance()));

  // local data source
  instance.registerLazySingleton<LocalDataSource>(
          () => LocalDataSourceImpl());

  instance.registerLazySingleton<BlogRepository>(() => BlogRepositoryImpl());

  instance.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(instance(),instance()));

}

void resetModule() {
  instance.reset(dispose: true);
}
