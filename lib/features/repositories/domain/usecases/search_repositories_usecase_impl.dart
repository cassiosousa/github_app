import 'package:github_app/features/repositories/domain/entities/repository_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:github_app/features/repositories/domain/repositories/search_repositories_repository.dart';
import 'package:github_app/features/repositories/domain/usecases/search_repositories_usecase.dart';

class SearchRepositoriesUsecaseImpl implements SearchRepositoriesUsecase {
  final SearchRepositoriesRepository _searchRepositoriesRepository;
  SearchRepositoriesUsecaseImpl(this._searchRepositoriesRepository);
  @override
  Future<Either<Exception, List<RepositoryEntity>>> call(String query) async =>
      await _searchRepositoriesRepository(query);
}
