import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:github_app/core/domain/services/http_service.dart';
import 'package:github_app/core/utils/api.dart';
import 'package:github_app/features/repositories/data/datasources/search_repositories_datasource.dart';
import 'package:github_app/features/repositories/data/dtos/repository_dto.dart';
import 'package:github_app/features/repositories/domain/entities/repository_entity.dart';

class SearchRepositoriesRemoteDatasourceImpl
    implements SearchRepositoriesDatasource {
  final HttpService _httpService;
  SearchRepositoriesRemoteDatasourceImpl(this._httpService);
  @override
  Future<Either<Exception, List<RepositoryEntity>>> call(String query) async {
    try {
      final response = await _httpService
          .get(API.REQUEST_SEARCH_REPOSITORIES, queryParameters: {'q': query});
      final List<dynamic> listOfRepositories = (response.data['items']);
      final results = listOfRepositories
          .map((item) => RepositoryDto.fromJson(item))
          .toList();

      return Right(results);
    } catch (e) {
      return Left(Exception('Falha ao buscar repositorios com a busca $query'));
    }
  }
}
