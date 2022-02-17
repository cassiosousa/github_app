import 'package:github_app/features/profiles/data/datasources/fetch_repositories_datasource.dart';
import 'package:github_app/features/profiles/domain/entities/repository_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:github_app/features/profiles/domain/repositories/fetch_repositories_repository.dart';

class FetchRepositoriesRepositoryImpl implements FetchRepositoriesRepository {
  final FetchRepositoriesDataSource _fetchRepositoriesDataSource;
  FetchRepositoriesRepositoryImpl(this._fetchRepositoriesDataSource);
  @override
  Future<Either<Exception, List<RepositoryEntity>>> call(String login) async {
    return await _fetchRepositoriesDataSource(login);
  }
}
