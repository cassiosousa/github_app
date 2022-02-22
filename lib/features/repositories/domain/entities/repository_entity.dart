import 'package:github_app/features/repositories/domain/entities/license_entity.dart';
import 'package:github_app/features/repositories/domain/entities/owner_entity.dart';

class RepositoryEntity {
  
  RepositoryEntity({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.private,
    required this.owner,
    required this.htmlUrl,
    required this.description,
    required this.fork,
    required this.url,
    required this.forksUrl,
    required this.keysUrl,
    required this.collaboratorsUrl,
    required this.teamsUrl,
    required this.hooksUrl,
    required this.issueEventsUrl,
    required this.eventsUrl,
    required this.assigneesUrl,
    required this.branchesUrl,
    required this.tagsUrl,
    required this.blobsUrl,
    required this.gitTagsUrl,
    required this.gitRefsUrl,
    required this.treesUrl,
    required this.statusesUrl,
    required this.languagesUrl,
    required this.stargazersUrl,
    required this.contributorsUrl,
    required this.subscribersUrl,
    required this.subscriptionUrl,
    required this.commitsUrl,
    required this.gitCommitsUrl,
    required this.commentsUrl,
    required this.issueCommentUrl,
    required this.contentsUrl,
    required this.compareUrl,
    required this.mergesUrl,
    required this.archiveUrl,
    required this.downloadsUrl,
    required this.issuesUrl,
    required this.pullsUrl,
    required this.milestonesUrl,
    required this.notificationsUrl,
    required this.labelsUrl,
    required this.releasesUrl,
    required this.deploymentsUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
    required this.gitUrl,
    required this.sshUrl,
    required this.cloneUrl,
    required this.svnUrl,
    required this.homepage,
    required this.size,
    required this.stargazersCount,
    required this.watchersCount,
    required this.language,
    required this.hasIssues,
    required this.hasProjects,
    required this.hasDownloads,
    required this.hasWiki,
    required this.hasPages,
    required this.forksCount,
    required this.archived,
    required this.disabled,
    required this.openIssuesCount,
    required this.license,
    required this.allowForking,
    required this.isTemplate,
    required this.topics,
    required this.visibility,
    required this.forks,
    required this.openIssues,
    required this.watchers,
    required this.defaultBranch,
    required this.score,
  });
  late final int id;
  late final String nodeId;
  late final String name;
  late final String fullName;
  late final bool private;
  late final OwnerEntity owner;
  late final String htmlUrl;
  late final String description;
  late final bool fork;
  late final String url;
  late final String forksUrl;
  late final String keysUrl;
  late final String collaboratorsUrl;
  late final String teamsUrl;
  late final String hooksUrl;
  late final String issueEventsUrl;
  late final String eventsUrl;
  late final String assigneesUrl;
  late final String branchesUrl;
  late final String tagsUrl;
  late final String blobsUrl;
  late final String gitTagsUrl;
  late final String gitRefsUrl;
  late final String treesUrl;
  late final String statusesUrl;
  late final String languagesUrl;
  late final String stargazersUrl;
  late final String contributorsUrl;
  late final String subscribersUrl;
  late final String subscriptionUrl;
  late final String commitsUrl;
  late final String gitCommitsUrl;
  late final String commentsUrl;
  late final String issueCommentUrl;
  late final String contentsUrl;
  late final String compareUrl;
  late final String mergesUrl;
  late final String archiveUrl;
  late final String downloadsUrl;
  late final String issuesUrl;
  late final String pullsUrl;
  late final String milestonesUrl;
  late final String notificationsUrl;
  late final String labelsUrl;
  late final String releasesUrl;
  late final String deploymentsUrl;
  late final String createdAt;
  late final String updatedAt;
  late final String pushedAt;
  late final String gitUrl;
  late final String sshUrl;
  late final String cloneUrl;
  late final String svnUrl;
  late final String homepage;
  late final int size;
  late final int stargazersCount;
  late final int watchersCount;
  late final String language;
  late final bool hasIssues;
  late final bool hasProjects;
  late final bool hasDownloads;
  late final bool hasWiki;
  late final bool hasPages;
  late final int forksCount;

  late final bool archived;
  late final bool disabled;
  late final int openIssuesCount;
  final LicenseEntity? license;
  late final bool allowForking;
  late final bool isTemplate;
  late final List<String> topics;
  late final String visibility;
  late final int forks;
  late final int openIssues;
  late final int watchers;
  late final String defaultBranch;
  late final double score;

  @override
  String toString() {
    return '{id:$id,name:$name}';
  }
}
