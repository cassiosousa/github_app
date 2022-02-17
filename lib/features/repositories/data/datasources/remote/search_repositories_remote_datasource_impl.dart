import 'package:dartz/dartz.dart';
import 'package:github_app/core/domain/services/http_service.dart';
import 'package:github_app/core/utils/api.dart';
import 'package:github_app/features/repositories/data/datasources/search_repositories_datasource.dart';
import 'package:github_app/features/repositories/data/dtos/repository_dto.dart';
import 'package:github_app/features/repositories/domain/entities/repository_entity.dart';

List<RepositoryEntity> cache = [];

class SearchRepositoriesDatasourceImpl implements SearchRepositoriesDatasource {
  final HttpService _httpService;
  SearchRepositoriesDatasourceImpl(this._httpService);
  @override
  Future<Either<Exception, List<RepositoryEntity>>> call(String query) async {
    try {
      if (cache.isEmpty) {
        final response = await _httpService.get(API.REQUEST_SEARCH_REPOSITORIES,
            queryParameters: {'q': query});
        final List<dynamic> listOfRepositories = (response.data['items']);
        cache = listOfRepositories
            .map((item) => RepositoryDto.fromJson(item))
            .toList();
      }
      return Right(cache);
    } catch (e) {
      print(e);
      return Left(Exception('Falha ao buscar repositorios com a busca $query'));
    }
  }
}
