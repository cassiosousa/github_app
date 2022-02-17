import 'package:dartz/dartz.dart';
import 'package:github_app/features/repositories/domain/entities/repository_entity.dart';

abstract class SearchRepositoriesUsecase {
  Future<Either<Exception, List<RepositoryEntity>>> call(String query);
}
