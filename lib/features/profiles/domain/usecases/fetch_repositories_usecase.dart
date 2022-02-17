import 'package:dartz/dartz.dart';
import 'package:github_app/features/profiles/domain/entities/repository_entity.dart';

abstract class FetchRepositoriesUsecase {
  Future<Either<Exception, List<RepositoryEntity>>> call(String login);
}
