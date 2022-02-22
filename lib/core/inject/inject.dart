import 'package:get_it/get_it.dart';
import 'package:github_app/core/data/services/dio_http_service_impl.dart';
import 'package:github_app/core/domain/services/http_service.dart';
import 'package:github_app/features/profiles/data/datasources/fetch_profiles_datasource.dart';
import 'package:github_app/features/profiles/data/datasources/fetch_repositories_datasource.dart';
import 'package:github_app/features/profiles/data/datasources/local/fetch_profiles_local_datasource_decorator_imp.dart';
import 'package:github_app/features/profiles/data/datasources/remote/fetch_repositories_remote_datasource_impl.dart';
import 'package:github_app/features/profiles/data/repositories/fetch_profiles_repository_impl.dart';
import 'package:github_app/features/profiles/data/repositories/fetch_repositories_repository_impl.dart';
import 'package:github_app/features/profiles/domain/repositories/fetch_profiles_repository.dart';
import 'package:github_app/features/profiles/domain/repositories/fetch_repositories_repository.dart';
import 'package:github_app/features/profiles/domain/usecases/fetch_profiles_usecase.dart';
import 'package:github_app/features/profiles/domain/usecases/fetch_profiles_usecase_impl.dart';
import 'package:github_app/features/profiles/domain/usecases/fetch_repositories_usecase.dart';
import 'package:github_app/features/profiles/domain/usecases/fetch_repositories_usecase_impl.dart';
import 'package:github_app/features/repositories/data/datasources/local/search_repositories_datasource_decorator_impl.dart';
import 'package:github_app/features/repositories/data/datasources/remote/search_repositories_remote_datasource_impl.dart';
import 'package:github_app/features/repositories/data/datasources/search_repositories_datasource.dart';
import 'package:github_app/features/repositories/data/repositories/search_repositories_repository_impl.dart';
import 'package:github_app/features/repositories/domain/repositories/search_repositories_repository.dart';
import 'package:github_app/features/repositories/domain/usecases/search_repositories_usecase.dart';
import 'package:github_app/features/repositories/domain/usecases/search_repositories_usecase_impl.dart';

class Inject {
  static initialize() {
    final getIt = GetIt.I;

    //core
    getIt.registerLazySingleton<HttpService>(() => DioHttpServiceImp());

    //data sources
    getIt.registerLazySingleton<FetchProfilesDataSource>(
      () => FetchProfilesLocalDataSourceDecoratorImp(getIt()),
    );

    getIt.registerLazySingleton<FetchRepositoriesDataSource>(
      () => FetchRepositoriesDataSourceImpl(getIt()),
    );

    getIt.registerLazySingleton<SearchRepositoriesDatasource>(
      () => SearchRepositoriesLocalDatasourceDecoratorImpl(
        SearchRepositoriesRemoteDatasourceImpl(getIt()),
      ),
    );

    // Repositories
    getIt.registerLazySingleton<FetchProfilesRepository>(
      () => FetchProfilesRepositoryImpl(getIt()),
    );

    getIt.registerLazySingleton<SearchRepositoriesRepository>(
      () => SearchRepositoriesRepositoryImpl(getIt()),
    );

    getIt.registerLazySingleton<FetchRepositoriesRepository>(
      () => FetchRepositoriesRepositoryImpl(getIt()),
    );

    //usecase
    getIt.registerLazySingleton<FetchProfilesUseCase>(
      () => FetchProfilesUseCaseImpl(getIt()),
    );
    getIt.registerLazySingleton<SearchRepositoriesUsecase>(
      () => SearchRepositoriesUsecaseImpl(getIt()),
    );
    getIt.registerLazySingleton<FetchRepositoriesUsecase>(
      () => FetchRepositoriesUsecaseImpl(getIt()),
    );

    //controllers
  }
}
