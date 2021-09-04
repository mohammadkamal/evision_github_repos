import 'package:evision_github_repos/models/github_repo.dart';
import 'package:evision_github_repos/views/github_repo_grid_item.dart';
import 'package:flutter/material.dart';

//////////////////////////////////////////////////////////
/// Grid builder for grid items

class GithubReposGridView extends StatelessWidget {
  final List<GithubRepo> repos;

  const GithubReposGridView({Key? key, required this.repos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: repos.length,
      itemBuilder: (context, index) {
        return GithubRepoGridItem(githubRepo: repos[index]);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  
}
