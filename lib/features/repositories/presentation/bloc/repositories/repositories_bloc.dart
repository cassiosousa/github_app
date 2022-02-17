import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/features/repositories/domain/usecases/search_repositories_usecase.dart';
import 'package:github_app/features/repositories/presentation/bloc/repositories/repositories_event.dart';
import 'package:github_app/features/repositories/presentation/bloc/repositories/repositories_state.dart';
import 'package:github_app/features/repositories/presentation/dtos/repository_dto.dart';

class RepositoriesBloc extends Bloc<RepositoriesEvent, RepositoriesState> {
  final SearchRepositoriesUsecase _repositoriesUsecase;
  RepositoriesBloc(this._repositoriesUsecase) : super(RepositoriesSuccess([])) {
    on<RepositoriesInit>(_onInit);
    on<RepositoriesSearch>(_onLoading);
  }
  void _onInit(RepositoriesInit event, Emitter<RepositoriesState> emit) async {
    emit(const RepositoriesSuccess([]));
  }

  void _onLoading(
      RepositoriesSearch event, Emitter<RepositoriesState> emit) async {
    emit(RepositoriesLoading());
    final result = await _repositoriesUsecase("flutter");
    result.fold(
      (error) => emit(RepositoriesFail()),
      (result) => emit(
        RepositoriesSuccess(
          result.map((e) => RepositoryDto.fromEntity(e)).toList(),
        ),
      ),
    );
  }
}
