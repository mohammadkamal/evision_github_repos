import 'package:evision_github_repos/utils/get_from_saved_files.dart';
import 'package:evision_github_repos/views/github_owner_card.dart';
import 'package:evision_github_repos/views/github_repos_grid_view.dart';
import 'package:evision_github_repos/views/github_repos_list_view.dart';
import 'package:evision_github_repos/views/settings_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// To store grid and list options
enum ListTypeEnum { list, grid }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // To specify which mode to display
  ListTypeEnum _listTypeEnum = ListTypeEnum.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home page'),
          actions: [
            // Button to Settings
            SettingsIconButton()
          ],
        ),
        body: Column(children: [
          // Display Owner Card info
          _futureOwner(),
          // To Fix the problem for the nest listview
          Expanded(
              child: Stack( // To display icons to switch between grid and list on top of the repos
            children: [_viewRepos(), _gridListIcons()],
          )),
        ]));
  }

  Widget _futureOwner() {
    return FutureBuilder(
      future: getOwner(), // Future builder to display owner card after it receives data from future function
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return GithubOwnerCard(
            githubOwner: snapshot.data,
          );
        } else {
          // A widget to display until the data is receives
          return Container(
            alignment: Alignment.center,
            child: Text('Please use the icon above to enter username'),
          );
        }
      },
    );
  }

  Widget _viewRepos() {
    return FutureBuilder( // Future builder to display owner card after it receives data from future function
        future: getRepos(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            // Check for the type of view (Grid or List)
            if (_listTypeEnum == ListTypeEnum.grid) {
              return GithubReposGridView(repos: snapshot.data);
            } else { // If list
              return GithubReposListView(repos: snapshot.data);
            }
          } else {
            return Container(
              child: Text('No data available'),
            );
          }
        });
  }

  Widget _gridListIcons() { // A widget to switch between grid and list views
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Icon for grid
        IconButton(
          onPressed: () => setState(() { // Widget rebuilds after it changes the type
            _listTypeEnum = ListTypeEnum.grid;
          }),
          icon: Icon(
            Icons.grid_on,
            color:
                _listTypeEnum == ListTypeEnum.grid ? Colors.blue : Colors.black,
          ),
        ),
        // Icon for list
        IconButton(
            onPressed: () => setState(() {
                  _listTypeEnum = ListTypeEnum.list;
                }),
            icon: Icon(CupertinoIcons.text_alignleft,
                color: _listTypeEnum == ListTypeEnum.list
                    ? Colors.blue
                    : Colors.black))
      ],
    );
  }
}
