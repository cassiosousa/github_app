import 'package:flutter_test/flutter_test.dart';
import 'package:github_app/features/profiles/data/datasources/fetch_profiles_datasource.dart';
import 'package:github_app/features/profiles/data/datasources/remote/fetch_profiles_remote_datasource_impl.dart';

import '../../../../../utils/http_service_mocks/http_service_error_mocks.dart';
import '../../../../../utils/http_service_mocks/http_service_mocks.dart';

void main() {
  late FetchProfilesDataSource fetchProfilesRemoteDataSourceImpl;

  group('Success Response', () {
    setUp(() {
      fetchProfilesRemoteDataSourceImpl =
          FetchProfilesRemoteDataSourceImpl(HttpProfileRemoteMock());
    });
    test('it should receive a one profile', () async {
      final response = await fetchProfilesRemoteDataSourceImpl();
      expect(false, response.isLeft());
      expect(true, response.isRight());
    });
  });

  group('Error response badrequest', () {
    setUp(() {
      fetchProfilesRemoteDataSourceImpl =
          FetchProfilesRemoteDataSourceImpl(HttpErrorBadRequestMock());
    });

    test('it should have a response with error badrequest.', () async {
      final response = await fetchProfilesRemoteDataSourceImpl();
      expect(true, response.isLeft());
    });

    test('it should have a response without profile.', () async {
      final response = await fetchProfilesRemoteDataSourceImpl();
      expect(true, response.isLeft());
      expect(false, response.isRight());
    });
  });
}
