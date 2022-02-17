import 'package:equatable/equatable.dart';

abstract class ProfileRepositoriesEvent extends Equatable {
  const ProfileRepositoriesEvent();

  @override
  List<Object> get props => [];
}

class ProfileRepositoriesStart extends ProfileRepositoriesEvent {
  final String login;
  const ProfileRepositoriesStart(this.login);
}
