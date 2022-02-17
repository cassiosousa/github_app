import 'package:github_app/features/profiles/data/datasources/fetch_profiles_datasource.dart';
import 'package:github_app/features/profiles/domain/entities/profile_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:github_app/features/profiles/domain/repositories/fetch_profiles_repository.dart';

class FetchProfilesRepositoryImpl implements FetchProfilesRepository {
  final FetchProfilesDataSource _fetchProfilesDataSource;

  FetchProfilesRepositoryImpl(this._fetchProfilesDataSource);

  @override
  Future<Either<Exception, ProfileEntity>> call() async {
    return await _fetchProfilesDataSource();
  }
}
