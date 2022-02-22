import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:github_app/features/repositories/data/datasources/local/search_repositories_datasource_decorator.dart';
import 'package:github_app/features/repositories/data/datasources/search_repositories_datasource.dart';
import 'package:github_app/features/repositories/data/dtos/repository_dto.dart';
import 'package:github_app/features/repositories/domain/entities/repository_entity.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SearchRepositoriesLocalDatasourceDecoratorImpl
    extends SearchRepositoriesDatasourceDecorator {
  SearchRepositoriesLocalDatasourceDecoratorImpl(
      SearchRepositoriesDatasource searchRepositoriesDatasource)
      : super(searchRepositoriesDatasource);
  @override
  Future<Either<Exception, List<RepositoryEntity>>> call(String query) async {
    return (await super(query)).fold(
      (error) async => Right(await _readFromCache(query)),
      (result) {
        _saveInCache(query, result);
        return Right(result);
      },
    );
  }

  void _saveInCache(String query, List<RepositoryEntity> repositories) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        query, jsonEncode(repositories.map((e) => e.toJson()).toList()));
  }

  Future<List<RepositoryEntity>> _readFromCache(String query) async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(query);

    if (json != null) {
      return (jsonDecode(json) as List)
          .map((e) => RepositoryDto.fromJson(e))
          .toList();
    }
    return [];
  }
}
