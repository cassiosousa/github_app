import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/features/repositories/presentation/dtos/repository_dto.dart';
import 'package:github_app/features/repositories/domain/usecases/search_repositories_usecase.dart';
import 'package:github_app/features/repositories/presentation/bloc/repositories/repositories_event.dart';
import 'package:github_app/features/repositories/presentation/bloc/repositories/repositories_state.dart';

class RepositoriesBloc extends Bloc<RepositoriesEvent, RepositoriesState> {
  final SearchRepositoriesUsecase _repositoriesUsecase;
  StreamSubscription? _streamSubscription;
  RepositoriesBloc(this._repositoriesUsecase)
      : super(const RepositoriesSuccess([])) {
    on<RepositoriesInit>(_onInit);
    on<RepositoriesSearch>(_onLoading);
    on<RepositoriesFinish>(_onFinish);
  }
  void _onInit(RepositoriesInit event, Emitter<RepositoriesState> emit) async {
    emit(const RepositoriesSuccess([]));
  }

  void _onLoading(
      RepositoriesSearch event, Emitter<RepositoriesState> emit) async {
    emit(RepositoriesLoading());
    _streamSubscription?.cancel();

    _streamSubscription =
        _repositoriesUsecase(event.text).asStream().listen((event) {
      event.fold(
        (error) => emit(RepositoriesFail()),
        (result) => add(
          RepositoriesFinish(
            (result.map((e) => RepositoryDto.fromEntity(e)).toList()),
          ),
        ),
      );
    });
  }

  void _onFinish(
      RepositoriesFinish event, Emitter<RepositoriesState> emit) async {
    emit(RepositoriesSuccess(event.repositories));
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
