import 'package:equatable/equatable.dart';

abstract class RepositoriesSearchState extends Equatable {
  const RepositoriesSearchState();

  @override
  List<Object> get props => [];
}

class RepositoriesSearchProgress extends RepositoriesSearchState {
  final String text;
  const RepositoriesSearchProgress(this.text);

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'RepositoriesSearchProgress { text: $text }';
}

class RepositoriesSearchSuccess extends RepositoriesSearchState {
  final String _text;
  String get text => _text;
  const RepositoriesSearchSuccess(text) : _text = text;

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'RepositoriesSearchSucess { text: $text }';
}
