class ProfileEntity {
  ProfileEntity({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.reposUrl,
    required this.type,
    required this.name,
    required this.blog,
    required this.location,
    required this.bio,
    required this.publicRepos,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.updatedAt,
  });

  late final String login;
  late final int id;
  late final String avatarUrl;
  late final String url;
  late final String htmlUrl;
  late final String followersUrl;
  late final String followingUrl;
  late final String reposUrl;
  late final String type;
  late final String name;
  late final String blog;
  late final String location;
  late final int publicRepos;
  late final String bio;
  late final int followers;
  late final int following;
  late final String createdAt;
  late final String updatedAt;

  @override
  bool operator ==(other) {
    return (other is ProfileEntity) && other.id == id;
  }

  @override
  String toString() {
    return "{id:$id,login:$login}";
  }

  @override
  int get hashCode => id.hashCode;
}
