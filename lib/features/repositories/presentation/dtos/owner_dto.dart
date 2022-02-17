import 'package:equatable/equatable.dart';
import 'package:github_app/features/repositories/domain/entities/owner_entity.dart';

class OwnerDto extends Equatable {
  final int id;
  final String login;
  final String avatarUrl;

  const OwnerDto(
      {required this.id, required this.login, required this.avatarUrl});

  OwnerDto copyWith(
      {required int id, required String login, required avatarUrl}) {
    return OwnerDto(id: id, login: login, avatarUrl: avatarUrl);
  }

  static OwnerDto fromEntity(OwnerEntity entity) {
    return OwnerDto(
        id: entity.id, login: entity.login, avatarUrl: entity.avatarUrl);
  }

  @override
  List<Object?> get props => [login];
}
