import 'package:dartz/dartz.dart';
import 'package:github_app/features/repositories/data/datasources/search_repositories_datasource.dart';
import 'package:github_app/features/repositories/domain/entities/repository_entity.dart';

class SearchRepositoriesDatasourceDecorator
    implements SearchRepositoriesDatasource {
  final SearchRepositoriesDatasource _searchRepositoriesDatasource;
  SearchRepositoriesDatasourceDecorator(this._searchRepositoriesDatasource);
  @override
  Future<Either<Exception, List<RepositoryEntity>>> call(String query) async {
    return _searchRepositoriesDatasource(query);
  }
}
