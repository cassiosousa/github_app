import 'package:equatable/equatable.dart';
import 'package:github_app/features/repositories/domain/entities/repository_entity.dart';
import 'package:github_app/features/repositories/presentation/dtos/owner_dto.dart';

class RepositoryDto extends Equatable {
  final int id;
  final String name;
  final int star;
  final OwnerDto ownerDto;

  const RepositoryDto(
      {required this.id,
      required this.name,
      required this.star,
      required this.ownerDto});

  RepositoryDto copyWith(
      {required int id,
      required String name,
      required int star,
      required ownerDto}) {
    return RepositoryDto(id: id, name: name, star: star, ownerDto: ownerDto);
  }

  static RepositoryDto fromEntity(RepositoryEntity entity) {
    return RepositoryDto(
      id: entity.id,
      name: entity.name,
      star: entity.forksCount,
      ownerDto: OwnerDto.fromEntity(entity.owner),
    );
  }

  @override
  List<Object?> get props => [id, name];
}
