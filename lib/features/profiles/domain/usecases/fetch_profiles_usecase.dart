import 'package:dartz/dartz.dart';
import 'package:github_app/features/profiles/domain/entities/profile_entity.dart';

abstract class FetchProfilesUseCase {
  Future<Either<Exception, ProfileEntity>> call();
}
