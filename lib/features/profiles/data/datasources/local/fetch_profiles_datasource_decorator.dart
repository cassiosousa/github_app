import 'package:dartz/dartz.dart';
import 'package:github_app/features/profiles/data/datasources/fetch_profiles_datasource.dart';
import 'package:github_app/features/profiles/domain/entities/profile_entity.dart';

class FetchProfilesDataSourceDecorator implements FetchProfilesDataSource {
  final FetchProfilesDataSource _fetchProfilesDataSource;

  FetchProfilesDataSourceDecorator(this._fetchProfilesDataSource);

  @override
  Future<Either<Exception, ProfileEntity>> call() => _fetchProfilesDataSource();
}
