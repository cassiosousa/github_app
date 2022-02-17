import 'package:flutter_test/flutter_test.dart';
import 'package:github_app/features/profiles/data/repositories/fetch_profiles_repository_impl.dart';
import 'package:github_app/features/profiles/domain/entities/profile_entity.dart';
import 'package:github_app/features/profiles/domain/repositories/fetch_profiles_repository.dart';

import 'fetch_profiles_repository_mocks.dart';

void main() {
  late FetchProfilesRepository _fetchProfilesRepository;

  group('Success profiles', () {
    setUp(() {
      _fetchProfilesRepository =
          FetchProfilesRepositoryImpl(SuccessFetchProfileDataSourceMock());
    });
    test('It should have a profile.', () async {
      bool existProfile = true;
      final result = await _fetchProfilesRepository();
      expect(existProfile, result.isRight());
    });

    test('It should have a profile with login cassiosousa.', () async {
      final result = await _fetchProfilesRepository();
      late ProfileEntity profileEntity;
      result.fold((left) => null, (right) => profileEntity = right);

      expect('cassiosousa', profileEntity.login);
    });
  });

  group('Fail profiles', () {
    setUp(() {
      _fetchProfilesRepository =
          FetchProfilesRepositoryImpl(FailFetchProfileDataSourceMock());
    });

    test('It should have a fail result.', () async {
      bool existProfile = true;
      final result = await _fetchProfilesRepository();
      expect(existProfile, result.isLeft());
    });

    test('It should have a fail message.', () async {
      final result = await _fetchProfilesRepository();
      late Exception error;
      result.fold((left) => error = left, (right) => null);
      expect(true, error is Exception);
    });
  });
}
