import 'package:github_app/features/repositories/data/datasources/search_repositories_datasource.dart';
import 'package:github_app/features/repositories/domain/entities/repository_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:github_app/features/repositories/domain/repositories/search_repositories_repository.dart';

class SearchRepositoriesRepositoryImpl implements SearchRepositoriesRepository {
  final SearchRepositoriesDatasource _searchRepositoriesDatasource;
  SearchRepositoriesRepositoryImpl(this._searchRepositoriesDatasource);
  @override
  Future<Either<Exception, List<RepositoryEntity>>> call(String query) async {
    return await _searchRepositoriesDatasource(query);
  }
}
