import 'package:equatable/equatable.dart';

abstract class RepositoriesEvent extends Equatable {
  const RepositoriesEvent();

  @override
  List<Object> get props => [];
}

class RepositoriesInit extends RepositoriesEvent {}

class RepositoriesSearch extends RepositoriesEvent {}
