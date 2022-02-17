import 'package:github_app/features/profiles/domain/entities/repository_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:github_app/features/profiles/domain/repositories/fetch_repositories_repository.dart';
import 'package:github_app/features/profiles/domain/usecases/fetch_repositories_usecase.dart';

class FetchRepositoriesUsecaseImpl implements FetchRepositoriesUsecase {
  final FetchRepositoriesRepository _fetchRepositoriesRepository;
  FetchRepositoriesUsecaseImpl(this._fetchRepositoriesRepository);

  @override
  Future<Either<Exception, List<RepositoryEntity>>> call(String login) async {
    return await _fetchRepositoriesRepository(login);
  }
}
