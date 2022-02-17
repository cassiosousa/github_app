import 'package:github_app/features/profiles/domain/entities/profile_entity.dart';

extension ProfileDto on ProfileEntity {
  static ProfileEntity fromJson(Map<String, dynamic> json) {
    return ProfileEntity(
      login: json['login'],
      id: json['id'],
      avatarUrl: json['avatar_url'],
      url: json['url'],
      htmlUrl: json['html_url'],
      followersUrl: json['followers_url'],
      followingUrl: json['following_url'],
      reposUrl: json['repos_url'],
      type: json['type'],
      name: json['name'],
      blog: json['blog'],
      location: json['location'],
      bio: json['bio'] ?? "",
      publicRepos: json['public_repos'],
      followers: json['followers'],
      following: json['following'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['login'] = login;
    _data['id'] = id;
    _data['avatar_url'] = avatarUrl;

    _data['url'] = url;
    _data['html_url'] = htmlUrl;
    _data['followers_url'] = followersUrl;
    _data['following_url'] = followingUrl;

    _data['repos_url'] = reposUrl;
    _data['type'] = type;
    _data['name'] = name;
    _data['blog'] = blog;
    _data['location'] = location;
    _data['bio'] = bio;
    _data['public_repos'] = publicRepos;
    _data['followers'] = followers;
    _data['following'] = following;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
