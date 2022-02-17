import 'package:dartz/dartz.dart';
import 'package:github_app/features/profiles/data/datasources/fetch_profiles_datasource.dart';
import 'package:github_app/features/profiles/domain/entities/profile_entity.dart';

class SuccessFetchProfileDataSourceMock implements FetchProfilesDataSource {
  @override
  Future<Either<Exception, ProfileEntity>> call() async {
    return Right(ProfileEntity(
      login: 'cassiosousa',
      id: 123,
      avatarUrl: '',
      url: '',
      htmlUrl: '',
      followersUrl: '',
      followingUrl: '',
      reposUrl: '',
      type: '',
      name: '',
      blog: '',
      location: '',
      bio: '',
      publicRepos: 2,
      followers: 12,
      following: 12,
      createdAt: '',
      updatedAt: '',
    ));
  }
}

class FailFetchProfileDataSourceMock implements FetchProfilesDataSource {
  @override
  Future<Either<Exception, ProfileEntity>> call() async {
    return Left(Exception("Cannot fetch profile."));
  }
}
