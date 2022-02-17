import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/features/profiles/domain/usecases/fetch_repositories_usecase.dart';
import 'package:github_app/features/profiles/presentation/bloc/profile/profile_repositories_event.dart';
import 'package:github_app/features/profiles/presentation/bloc/profile/profile_repositories_state.dart';
import 'package:github_app/features/profiles/presentation/dtos/repository_dto.dart';

class ProfileRepositoriesBloc
    extends Bloc<ProfileRepositoriesEvent, ProfileRepositoriesState> {
  final FetchRepositoriesUsecase _fetchRepositoriesUsecase;
  ProfileRepositoriesBloc(this._fetchRepositoriesUsecase)
      : super(const ProfileRepositoriesSuccess([])) {
    on<ProfileRepositoriesStart>(_onStart);
  }
  void _onStart(ProfileRepositoriesStart event,
      Emitter<ProfileRepositoriesState> emit) async {
    emit(ProfileRepositoriesLoading());
    final result = await _fetchRepositoriesUsecase(event.login);
    result.fold(
      (error) => emit(ProfileRepositoriesFail()),
      (result) => emit(
        ProfileRepositoriesSuccess(
          result.map((e) => RepositoryDto.fromEntity(e)).toList(),
        ),
      ),
    );
  }
}
