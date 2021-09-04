import 'package:evision_github_repos/models/github_repo.dart';
import 'package:flutter/material.dart';

////////////////////////////////////////////////////////
/// Split main widget to smaller widget to avoid rebuilding in the future
/// Check for nullable variables and fields

class GithubRepoListItem extends StatelessWidget {
  final GithubRepo githubRepo;

  const GithubRepoListItem({Key? key, required this.githubRepo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3, bottom: 3),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GithubRepoListItemLanguage(
                language: githubRepo.language,
              ),
              GithubRepoListItemUpdated(
                updatedAt: githubRepo.updatedAt,
              )
            ],
          )
        ],
      ),
    );
  }
}

class GithubRepoListItemName extends StatelessWidget {
  final String? name;

  const GithubRepoListItemName({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name == null ? 'No name provided!' : name!,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

class GithubRepoListItemDescription extends StatelessWidget {
  final String? description;

  const GithubRepoListItemDescription({Key? key, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description == null ? 'No description provided!' : description!,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Colors.grey),
    );
  }
}

class GithubRepoListItemLanguage extends StatelessWidget {
  final String? language;

  const GithubRepoListItemLanguage({Key? key, this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(language == null ? 'No language detected!' : language!);
  }
}

class GithubRepoListItemUpdated extends StatelessWidget {
  final String? updatedAt;

  const GithubRepoListItemUpdated({Key? key, this.updatedAt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime updateTime;
    if (updatedAt != null) {
      updateTime = DateTime.parse(updatedAt!);
      return Text('Last updated ' +
          DateTime.now().difference(updateTime).inDays.toString() +
          ' days ago');
    } else {
      print(updatedAt);
      return Text('Update info unavailable!');
    }
  }
}
