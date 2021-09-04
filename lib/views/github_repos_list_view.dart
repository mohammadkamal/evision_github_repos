import 'package:evision_github_repos/models/github_repo.dart';
import 'package:evision_github_repos/views/github_repo_list_item.dart';
import 'package:flutter/material.dart';

//////////////////////////////////////////////////////////
/// List builder for list items

class GithubReposListView extends StatelessWidget {
  final List<GithubRepo> repos;

  const GithubReposListView({Key? key, required this.repos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: repos.length,
      itemBuilder: (context, index) {
        return GithubRepoListItem(githubRepo: repos[index]);
      },
    );
  }
}
