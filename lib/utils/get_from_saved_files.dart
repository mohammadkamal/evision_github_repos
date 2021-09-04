import 'dart:convert';

import 'package:evision_github_repos/models/github_owner.dart';
import 'package:evision_github_repos/models/github_repo.dart';
import 'package:evision_github_repos/utils/file_storage.dart';

//////////////////////////////////////////////////////////////////////////
/// 1. Get String data from file
/// 2. Decode String into json
/// 3. Transform json to object

Future<GithubOwner> getOwner() async {
  String _ownerData = await readDataFromFile('github_owner.json');
  var json = jsonDecode(_ownerData);
  return GithubOwner.fromJson(json);
}

Future<List<GithubRepo>> getRepos() async {
  String _reposData = await readDataFromFile('github_repos.json');
  var json = jsonDecode(_reposData);
  return json.map<GithubRepo>((json) => GithubRepo.fromJson(json)).toList();
}