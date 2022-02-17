import 'package:github_app/features/profiles/domain/entities/profile_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:github_app/features/profiles/domain/repositories/fetch_profiles_repository.dart';
import 'package:github_app/features/profiles/domain/usecases/fetch_profiles_usecase.dart';

class FetchProfilesUseCaseImpl implements FetchProfilesUseCase {
  final FetchProfilesRepository _fetchProfilesRepository;
  FetchProfilesUseCaseImpl(this._fetchProfilesRepository);
  @override
  Future<Either<Exception, ProfileEntity>> call() async {
    return await _fetchProfilesRepository();
  }
}
