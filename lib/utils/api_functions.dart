import 'dart:io';
import 'package:http/http.dart' as http;

/////////////////////////////////////////////////////////////////////////////////////
/// 1. Try to connect to the API
/// 2. Fetch the response using http get function through a Future async
/// 3. Check the response:
///   a. If OK then return with json data
///   b. if not throw an error depending on its type

Future<String> fetchOwnerInfo(String username) async {
  try {
    // Fetch Response from api
    final response =
        await http.get(Uri.parse('https://api.github.com/users/' + username));

    // Check for different status conditions
    switch (response.statusCode) {
      case 200: // OK
        return response.body; // return with json in a string format
      case 404: // Not Found
        throw Exception('Failed to find owner!'); // User not found
      default:
        throw Exception('Error occured!'); // Other errors
    }
  } on SocketException {
    // Indicates that there's an error connecting to the network
    throw Exception('Network error');
  }
}

Future<String> fetchOwnerRepos(String username) async {
  try {
    final response = await http
        .get(Uri.parse('https://api.github.com/users/' + username + '/repos'));

    switch (response.statusCode) {
      case 200:
        return response.body;
      case 404:
        throw Exception('Failed to find repos!');
      default:
        throw Exception('Error occured!');
    }
  } on SocketException {
    // Indicates that there's an error connecting to the network
    throw Exception('Network error');
  }
}
