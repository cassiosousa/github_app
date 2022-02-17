import 'package:github_app/features/repositories/data/dtos/license_dto.dart';
import 'package:github_app/features/repositories/data/dtos/owner_dto.dart';
import 'package:github_app/features/repositories/domain/entities/repository_entity.dart';

extension RepositoryDto on RepositoryEntity {
  static RepositoryEntity fromJson(Map<String, dynamic> json) {
    return RepositoryEntity(
      id: json['id'] ?? '',
      nodeId: json['node_id'] ?? '',
      name: json['name'] ?? '',
      fullName: json['full_name'] ?? '',
      private: json['private'] ?? '',
      owner: OwnerDto.fromJson(json['owner']),
      htmlUrl: json['html_url'] ?? '',
      description: json['description'] ?? '',
      fork: json['fork'] ?? '',
      url: json['url'] ?? '',
      forksUrl: json['forks_url'] ?? '',
      keysUrl: json['keys_url'] ?? '',
      collaboratorsUrl: json['collaborators_url'] ?? '',
      teamsUrl: json['teams_url'] ?? '',
      hooksUrl: json['hooks_url'] ?? '',
      issueEventsUrl: json['issue_events_url'] ?? '',
      eventsUrl: json['events_url'] ?? '',
      assigneesUrl: json['assignees_url'] ?? '',
      branchesUrl: json['branches_url'] ?? '',
      tagsUrl: json['tags_url'] ?? '',
      blobsUrl: json['blobs_url'] ?? '',
      gitTagsUrl: json['git_tags_url'] ?? '',
      gitRefsUrl: json['git_refs_url'] ?? '',
      treesUrl: json['trees_url'] ?? '',
      statusesUrl: json['statuses_url'] ?? '',
      languagesUrl: json['languages_url'] ?? '',
      stargazersUrl: json['stargazers_url'] ?? '',
      contributorsUrl: json['contributors_url'] ?? '',
      subscribersUrl: json['subscribers_url'] ?? '',
      subscriptionUrl: json['subscription_url'] ?? '',
      commitsUrl: json['commits_url'] ?? '',
      gitCommitsUrl: json['git_commits_url'] ?? '',
      commentsUrl: json['comments_url'] ?? '',
      issueCommentUrl: json['issue_comment_url'] ?? '',
      contentsUrl: json['contents_url'] ?? '',
      compareUrl: json['compare_url'] ?? '',
      mergesUrl: json['merges_url'] ?? '',
      archiveUrl: json['archive_url'] ?? '',
      downloadsUrl: json['downloads_url'] ?? '',
      issuesUrl: json['issues_url'] ?? '',
      pullsUrl: json['pulls_url'] ?? '',
      milestonesUrl: json['milestones_url'] ?? '',
      notificationsUrl: json['notifications_url'] ?? '',
      labelsUrl: json['labels_url'] ?? '',
      releasesUrl: json['releases_url'] ?? '',
      deploymentsUrl: json['deployments_url'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      pushedAt: json['pushed_at'] ?? '',
      gitUrl: json['git_url'] ?? '',
      sshUrl: json['ssh_url'] ?? '',
      cloneUrl: json['clone_url'] ?? '',
      svnUrl: json['svn_url'] ?? '',
      homepage: json['homepage'] ?? '',
      size: json['size'] ?? '',
      stargazersCount: json['stargazers_count'] ?? '',
      watchersCount: json['watchers_count'] ?? '',
      language: json['language'] ?? '',
      hasIssues: json['has_issues'] ?? '',
      hasProjects: json['has_projects'] ?? '',
      hasDownloads: json['has_downloads'] ?? '',
      hasWiki: json['has_wiki'] ?? '',
      hasPages: json['has_pages'] ?? '',
      forksCount: json['forks_count'] ?? '',
      archived: json['archived'] ?? '',
      disabled: json['disabled'] ?? '',
      openIssuesCount: json['open_issues_count'] ?? '',
      license:
          json['license'] != null ? LicenseDto.fromJson(json['license']) : null,
      allowForking: json['allow_forking'] ?? '',
      isTemplate: json['is_template'] ?? '',
      topics: List.castFrom<dynamic, String>(json['topics']),
      visibility: json['visibility'] ?? '',
      forks: json['forks'] ?? '',
      openIssues: json['open_issues'] ?? '',
      watchers: json['watchers'] ?? '',
      defaultBranch: json['default_branch'] ?? '',
      score: json['score'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['node_id'] = nodeId;
    _data['name'] = name;
    _data['full_name'] = fullName;
    _data['private'] = private;
    _data['owner'] = owner.toJson();
    _data['html_url'] = htmlUrl;
    _data['description'] = description;
    _data['fork'] = fork;
    _data['url'] = url;
    _data['forks_url'] = forksUrl;
    _data['keys_url'] = keysUrl;
    _data['collaborators_url'] = collaboratorsUrl;
    _data['teams_url'] = teamsUrl;
    _data['hooks_url'] = hooksUrl;
    _data['issue_events_url'] = issueEventsUrl;
    _data['events_url'] = eventsUrl;
    _data['assignees_url'] = assigneesUrl;
    _data['branches_url'] = branchesUrl;
    _data['tags_url'] = tagsUrl;
    _data['blobs_url'] = blobsUrl;
    _data['git_tags_url'] = gitTagsUrl;
    _data['git_refs_url'] = gitRefsUrl;
    _data['trees_url'] = treesUrl;
    _data['statuses_url'] = statusesUrl;
    _data['languages_url'] = languagesUrl;
    _data['stargazers_url'] = stargazersUrl;
    _data['contributors_url'] = contributorsUrl;
    _data['subscribers_url'] = subscribersUrl;
    _data['subscription_url'] = subscriptionUrl;
    _data['commits_url'] = commitsUrl;
    _data['git_commits_url'] = gitCommitsUrl;
    _data['comments_url'] = commentsUrl;
    _data['issue_comment_url'] = issueCommentUrl;
    _data['contents_url'] = contentsUrl;
    _data['compare_url'] = compareUrl;
    _data['merges_url'] = mergesUrl;
    _data['archive_url'] = archiveUrl;
    _data['downloads_url'] = downloadsUrl;
    _data['issues_url'] = issuesUrl;
    _data['pulls_url'] = pullsUrl;
    _data['milestones_url'] = milestonesUrl;
    _data['notifications_url'] = notificationsUrl;
    _data['labels_url'] = labelsUrl;
    _data['releases_url'] = releasesUrl;
    _data['deployments_url'] = deploymentsUrl;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['pushed_at'] = pushedAt;
    _data['git_url'] = gitUrl;
    _data['ssh_url'] = sshUrl;
    _data['clone_url'] = cloneUrl;
    _data['svn_url'] = svnUrl;
    _data['homepage'] = homepage;
    _data['size'] = size;
    _data['stargazers_count'] = stargazersCount;
    _data['watchers_count'] = watchersCount;
    _data['language'] = language;
    _data['has_issues'] = hasIssues;
    _data['has_projects'] = hasProjects;
    _data['has_downloads'] = hasDownloads;
    _data['has_wiki'] = hasWiki;
    _data['has_pages'] = hasPages;
    _data['forks_count'] = forksCount;
    _data['archived'] = archived;
    _data['disabled'] = disabled;
    _data['open_issues_count'] = openIssuesCount;
    _data['license'] = license?.toJson();
    _data['allow_forking'] = allowForking;
    _data['is_template'] = isTemplate;
    _data['topics'] = topics;
    _data['visibility'] = visibility;
    _data['forks'] = forks;
    _data['open_issues'] = openIssues;
    _data['watchers'] = watchers;
    _data['default_branch'] = defaultBranch;
    _data['score'] = score;
    return _data;
  }
}
