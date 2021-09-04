import 'package:evision_github_repos/utils/api_functions.dart';
import 'package:evision_github_repos/utils/file_storage.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // For getting the text from textfield
  final _usernameController = TextEditingController();

  Widget _submitButton() {
    return ElevatedButton(onPressed: _onSubmit, child: Text('Submit'));
  }

  Future<void> _onSubmit() async {
    // Hide the soft keyboard and switch the focus node
    FocusScope.of(context).requestFocus(new FocusNode());

    try {
      // Get the user information & repos
      String _owner = await fetchOwnerInfo(_usernameController.text);
      String _repos = await fetchOwnerRepos(_usernameController.text);
      // If successed... save to the local storage settings then pop to the main screen and reload page
      writeDataToFile('github_owner.json', _owner);
      writeDataToFile('github_repos.json', _repos)
          .whenComplete(
              () => Navigator.popUntil(context, ModalRoute.withName('/')))
          .then((value) => Navigator.pushReplacementNamed(context, '/'));
      // Pop and push to fix backwards button after returning to the home page
    } catch (e) {
      // Show message error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 8, left: 20, right: 20),
          elevation: 0,
          content: Text(e.toString())));
    }
  }

  final __userNameInputDecor = InputDecoration(
      hintText: 'Enter github username...',
      border: OutlineInputBorder(borderSide: BorderSide(width: 1)));

  Widget _userNameTextField() {
    return TextField(
        autofocus: false,
        controller: _usernameController,
        decoration: __userNameInputDecor);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Settings'),
        content: ListView(shrinkWrap: true, children: [
          Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[_userNameTextField(), _submitButton()],
            ),
          ),
        ]));
  }
}
