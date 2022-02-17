import 'package:dartz/dartz.dart';
import 'package:github_app/features/profiles/data/datasources/fetch_profiles_datasource.dart';
import 'package:github_app/features/profiles/data/datasources/local/fetch_profiles_datasource_decorator.dart';
import 'package:github_app/features/profiles/data/dtos/profile_dto.dart';
import 'package:github_app/features/profiles/domain/entities/profile_entity.dart';

class FetchProfilesLocalDataSourceDecoratorImp
    extends FetchProfilesDataSourceDecorator {
  FetchProfilesLocalDataSourceDecoratorImp(
      FetchProfilesDataSource fetchProfilesDataSource)
      : super(fetchProfilesDataSource);

  @override
  Future<Either<Exception, ProfileEntity>> call() async {
    return (await super.call())
        .fold((error) async => Right(await _getInCache()), (result) {
      _saveInCache(result);
      return Right(result);
    });
  }

  _saveInCache(ProfileEntity profile) async {
    //TODO: savin cache
  }
  Future<ProfileEntity> _getInCache() async {
    return ProfileDto.fromJson({});
  }
}
