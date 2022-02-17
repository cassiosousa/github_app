import 'package:equatable/equatable.dart';
import 'package:github_app/features/profiles/presentation/dtos/repository_dto.dart';

abstract class ProfileRepositoriesState extends Equatable {
  const ProfileRepositoriesState();

  @override
  List<Object> get props => [];
}

class ProfileRepositoriesLoading extends ProfileRepositoriesState {}

class ProfileRepositoriesSuccess extends ProfileRepositoriesState {
  final List<RepositoryDto> repositories;
  const ProfileRepositoriesSuccess(this.repositories);

  @override
  List<Object> get props => [repositories];

  @override
  String toString() => 'ProfileLoadSuccess { profile: $repositories }';
}

class ProfileRepositoriesFail extends ProfileRepositoriesState {}
