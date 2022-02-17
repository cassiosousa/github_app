import 'package:equatable/equatable.dart';
import 'package:github_app/features/repositories/presentation/dtos/repository_dto.dart';

abstract class RepositoriesState extends Equatable {
  const RepositoriesState();

  @override
  List<Object> get props => [];
}

class RepositoriesLoading extends RepositoriesState {}

class RepositoriesSuccess extends RepositoriesState {
  final List<RepositoryDto> repositories;
  const RepositoriesSuccess(this.repositories);

  @override
  List<Object> get props => [repositories];

  @override
  String toString() => 'TodosLoadSuccess { todos: $repositories }';
}

class RepositoriesFail extends RepositoriesState {}
