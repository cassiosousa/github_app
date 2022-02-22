import 'package:equatable/equatable.dart';

abstract class RepositoriesSearchEvent extends Equatable {
  const RepositoriesSearchEvent();

  @override
  List<Object> get props => [];
}

class RepositoriesSearchInit extends RepositoriesSearchEvent {}

class RepositoriesSearchWriter extends RepositoriesSearchEvent {
  final String text;
  const RepositoriesSearchWriter(this.text);
  @override
  List<Object> get props => [text];
}

class RepositoriesSearchFinish extends RepositoriesSearchEvent {
  final String _text;
  String get text => _text;
  const RepositoriesSearchFinish(String text) : _text = text;
  @override
  List<Object> get props => [text];
}
