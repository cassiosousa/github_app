import 'package:dartz/dartz.dart';
import 'package:github_app/features/profiles/domain/entities/profile_entity.dart';

abstract class FetchProfilesRepository {
  Future<Either<Exception, ProfileEntity>> call();
}
