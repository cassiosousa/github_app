import 'package:equatable/equatable.dart';
import 'package:github_app/features/repositories/presentation/dtos/repository_dto.dart';

abstract class RepositoriesEvent extends Equatable {
  const RepositoriesEvent();

  @override
  List<Object> get props => [];
}

class RepositoriesInit extends RepositoriesEvent {}

class RepositoriesSearch extends RepositoriesEvent {
  final String _text;
  String get text => _text;
  const RepositoriesSearch(String text) : _text = text;
}

class RepositoriesFinish extends RepositoriesEvent {
  final List<RepositoryDto> _repositories;
  List<RepositoryDto> get repositories => _repositories;
  const RepositoriesFinish(List<RepositoryDto> repositories)
      : _repositories = repositories;
}
