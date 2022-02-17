import 'package:dartz/dartz.dart';
import 'package:github_app/core/domain/services/http_service.dart';
import 'package:github_app/core/utils/api.dart';
import 'package:github_app/features/profiles/data/datasources/fetch_profiles_datasource.dart';
import 'package:github_app/features/profiles/data/dtos/profile_dto.dart';
import 'package:github_app/features/profiles/domain/entities/profile_entity.dart';

class FetchProfilesRemoteDataSourceImpl implements FetchProfilesDataSource {
  final HttpService _httpService;
  FetchProfilesRemoteDataSourceImpl(this._httpService);

  @override
  Future<Either<Exception, ProfileEntity>> call() async {
    try {
      final result = await _httpService.get(API.REQUEST_PROFILE);
      return Right(ProfileDto.fromJson(result.data));
    } catch (e) {
      return Left(
          Exception('Falha ao tentar carregar dados do serviço externo'));
    }
  }
}
