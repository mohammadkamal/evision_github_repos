// Model class for github repos
class GithubRepo {
  // Api parameters at https://api.github.com/users/octocat/repos
  final int? repoId;
  final String? nodeId;
  final String? name;
  final bool? isPrivate;
  final String? htmlUrl;
  final String? description;
  final bool? isFork;
  final String? createdAt; //Covert to DateTime
  final String? updatedAt; //Covert to DateTime
  final String? pushedAt; //Covert to DateTime
  final int? size;
  final int? stargazersCount;
  final int? watchersCount;
  final String? language;
  final bool? hasIssues;
  final bool? hasProjects;
  final bool? hasDownloads;
  final bool? hasWiki;
  final bool? hasPages;
  final int? forksCount;
  final bool? isArchived;
  final bool? isDisabled;
  final int? openIssuesCount;
  // To be added: License
  final int? forks;
  final int? openIssues;
  final int? watchers;

  GithubRepo(
      {this.repoId,
      this.nodeId,
      this.name,
      this.isPrivate,
      this.htmlUrl,
      this.description,
      this.isFork,
      this.createdAt,
      this.updatedAt,
      this.pushedAt,
      this.size,
      this.stargazersCount,
      this.watchersCount,
      this.language,
      this.hasIssues,
      this.hasProjects,
      this.hasDownloads,
      this.hasWiki,
      this.hasPages,
      this.forksCount,
      this.isArchived,
      this.isDisabled,
      this.openIssuesCount,
      this.forks,
      this.openIssues,
      this.watchers});

  factory GithubRepo.fromJson(Map<String, dynamic> json) =>
      _$GithubRepoFromJson(json);
}

GithubRepo _$GithubRepoFromJson(Map<String, dynamic> json) => GithubRepo(
    repoId: json['id'],
    nodeId: json['node_id'],
    name: json['name'],
    isPrivate: json['private'],
    htmlUrl: json['html_url'],
    description: json['description'],
    isFork: json['fork'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    pushedAt: json['pushed_at'],
    size: json['size'],
    stargazersCount: json['stargazers_count'],
    watchersCount: json['watchers_count'],
    language: json['language'],
    hasIssues: json['has_issues'],
    hasProjects: json['has_projects'],
    hasDownloads: json['has_downloads'],
    hasWiki: json['has_wiki'],
    hasPages: json['has_pages'],
    forksCount: json['forks_count'],
    isArchived: json['archived'],
    isDisabled: json['disabled'],
    openIssuesCount: json['open_issues_count'],
    forks: json['forks'],
    openIssues: json['open_issues'],
    watchers: json['watchers']);
