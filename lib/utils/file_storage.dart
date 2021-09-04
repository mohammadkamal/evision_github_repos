import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String> getLocalPath() async {
  // Get the application internal directory
  final directory = await getApplicationDocumentsDirectory();
  // Return with the path of the directory
  return directory.path;
}

Future<File> getLocalFile(String fileName) async {
  // get file path
  final path = await getLocalPath();
  // Create a reference to the file location
  return File('$path/$fileName');
}

Future<File> writeDataToFile(String fileName, String data) async {
  // get file path
  final file = await getLocalFile(fileName);
  // Save string to file
  return file.writeAsString(data);
}

Future<String> readDataFromFile(String fileName) async {
  // get file path
  final file = await getLocalFile(fileName);
  // read the file and return with its contents
  return await file.readAsString();
}
