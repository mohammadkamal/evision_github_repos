import 'package:evision_github_repos/models/github_repo.dart';
import 'package:evision_github_repos/views/github_repo_list_item.dart';
import 'package:flutter/material.dart';

////////////////////////////////////////////////////////
/// Split main widget to smaller widget to avoid rebuilding in the future
/// Check for nullable variables and fields

class GithubRepoGridItem extends StatelessWidget {
  final GithubRepo githubRepo;

  const GithubRepoGridItem({Key? key, required this.githubRepo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 1.5)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GithubRepoListItemName(name: githubRepo.name),
          GithubRepoListItemDescription(description: githubRepo.description),
          GithubRepoListItemLanguage(
            language: githubRepo.language,
          ),
        ],
      ),
    );
  }
}