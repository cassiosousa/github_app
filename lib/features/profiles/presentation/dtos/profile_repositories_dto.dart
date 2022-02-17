import 'package:equatable/equatable.dart';
import 'package:github_app/features/profiles/domain/entities/repository_entity.dart';

class ProfileRepositoriesDto extends Equatable {
  final int id;
  final String name;
  final int star;

  const ProfileRepositoriesDto(
      {required this.id, required this.name, required this.star});

  ProfileRepositoriesDto copyWith(
      {required int id,
      required String name,
      required int star,
      required ownerDto}) {
    return ProfileRepositoriesDto(
        id: id, name: name, star: star);
  }

  static ProfileRepositoriesDto fromEntity(RepositoryEntity entity) {
    return ProfileRepositoriesDto(
      id: entity.id,
      name: entity.name,
      star: entity.forksCount,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
