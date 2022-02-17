import 'package:dartz/dartz.dart';
import 'package:github_app/core/domain/services/http_service.dart';
import 'package:github_app/core/utils/api.dart';
import 'package:github_app/features/profiles/data/datasources/fetch_repositories_datasource.dart';
import 'package:github_app/features/profiles/domain/entities/repository_entity.dart';
import 'package:github_app/features/profiles/data/dtos/repository_dto.dart';

class FetchRepositoriesDataSourceImpl implements FetchRepositoriesDataSource {
  final HttpService _httpService;
  FetchRepositoriesDataSourceImpl(this._httpService);
  @override
  Future<Either<Exception, List<RepositoryEntity>>> call(String login) async {
    try {
      final response = await _httpService.get(
        "${API.REQUEST_SEARCH_REPOSITORIES}/$login/repos",
      );
      final List<dynamic> listOfRepositories = (response.data);
      final repositories = listOfRepositories
          .map((item) => RepositoryDto.fromJson(item))
          .toList();
      return Right(repositories);
    } catch (e) {
      return Left(Exception('Falha ao buscar repositorios com o login $login'));
    }
  }
}
