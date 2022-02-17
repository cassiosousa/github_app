import 'package:github_app/features/profiles/domain/entities/repository_entity.dart';

extension RepositoryDto on RepositoryEntity {
  static RepositoryEntity fromJson(Map<String, dynamic> json) {
    return RepositoryEntity(
      id: json['id'],
      nodeId: json['node_id'],
      name: json['name'],
      fullName: json['full_name'],
      private: json['private'],
      htmlUrl: json['html_url'],
      description: json['description'],
      fork: json['fork'],
      url: json['url'],
      forksUrl: json['forks_url'],
      keysUrl: json['keys_url'],
      collaboratorsUrl: json['collaborators_url'],
      teamsUrl: json['teams_url'],
      forksCount: json['forks_count'],
    );
  }
}
