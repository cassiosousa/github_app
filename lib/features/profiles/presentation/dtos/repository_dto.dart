import 'package:equatable/equatable.dart';
import 'package:github_app/features/profiles/domain/entities/repository_entity.dart';

class RepositoryDto extends Equatable {
  final int id;
  final String name;
  final int star;

  const RepositoryDto(
      {required this.id, required this.name, required this.star});

  RepositoryDto copyWith(
      {required int id,
      required String name,
      required int star,
      required ownerDto}) {
    return RepositoryDto(id: id, name: name, star: star);
  }

  static RepositoryDto fromEntity(RepositoryEntity entity) {
    return RepositoryDto(
      id: entity.id,
      name: entity.name,
      star: entity.forksCount,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
