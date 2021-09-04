class GithubOwner {
  // Api parameters at https://api.github.com/users/octocat
  final String? loginName;
  final int? userId;
  final String? nodeId;
  final String? avatarUrl;
  final String? htmlUrl;
  final String? reposUrl;
  final String? userType;
  final String? displayName;
  final String? company;
  final String? blog;
  final String? location;
  final String? email;
  final int? publicRepos;
  final int? publicGists;
  final int? followers;
  final int? following;
  final String? createdAt; //Covert to DateTime
  final String? updatedAt; //Covert to DateTime
  final String? bio;

  GithubOwner(
      {this.loginName,
      this.avatarUrl,
      this.htmlUrl,
      this.reposUrl,
      this.userType,
      this.displayName,
      this.company,
      this.blog,
      this.location,
      this.email,
      this.publicRepos,
      this.publicGists,
      this.followers,
      this.following,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.nodeId,
      this.bio});

  factory GithubOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubOwnerFromJson(json);
}

GithubOwner _$GithubOwnerFromJson(Map<String, dynamic> json) => GithubOwner(
    loginName: json['login'],
    avatarUrl: json['avatar_url'],
    htmlUrl: json['html_url'],
    reposUrl: json['repos_url'],
    userType: json['type'],
    displayName: json['name'],
    company: json['company'],
    blog: json['blog'],
    location: json['location'],
    email: json['email'],
    publicRepos: json['public_repos'],
    publicGists: json['public_gists'],
    followers: json['followers'],
    following: json['following'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    userId: json['id'],
    nodeId: json['node_id'],
    bio: json['bio']);
