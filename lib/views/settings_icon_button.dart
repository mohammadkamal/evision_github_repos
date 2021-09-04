import 'package:evision_github_repos/utils/settings_page.dart';
import 'package:flutter/material.dart';

class SettingsIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Button to Settings
    return IconButton(
      icon: Icon(Icons.settings),
      onPressed: () =>
          showDialog(context: context, builder: (context) => SettingsPage()),
    );
  }
}
