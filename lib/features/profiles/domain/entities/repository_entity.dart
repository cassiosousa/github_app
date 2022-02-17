class RepositoryEntity {
  RepositoryEntity({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.private,
    required this.htmlUrl,
    required this.description,
    required this.fork,
    required this.url,
    required this.forksUrl,
    required this.keysUrl,
    required this.collaboratorsUrl,
    required this.teamsUrl,
    required this.forksCount,
  });
  late final int id;
  late final String nodeId;
  late final String name;
  late final String fullName;
  late final bool private;
  late final String htmlUrl;
  late final String description;
  late final bool fork;
  late final String url;
  late final String forksUrl;
  late final String keysUrl;
  late final String collaboratorsUrl;
  late final String teamsUrl;
  late final int forksCount;

  @override
  String toString() {
    return '{id:$id,name:$name}';
  }
}
