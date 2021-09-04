import 'package:evision_github_repos/utils/api_functions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Get repos json', () async {
    var _testOwner = await fetchOwnerRepos('mohammadkamal');
    print(_testOwner.toString());
  });
}
