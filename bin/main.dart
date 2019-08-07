import 'dart:io';
import 'package:prompter_qh/prompter_qh.dart';

void main() {
  final prompter = new Prompter();

  final bool choice = prompter.askBinary('Are you here to convert an image?');
  if(!choice) {
    exit(0);
  }

  final format = prompter.askMultiple('Select formate:', buildFormatOptions());
  prompter.askMultiple('Select an image to convert:', buildFileOptions());
}

List<Option> buildFormatOptions() {
  return [
    new Option('Convert to jpeg', 'jpeg'),
    new Option('Convert to png', 'png'),
  ];
}

List<Option> buildFileOptions() {
  // Get a reference to the current working directory

  // Find all the files and folders in the directory

  // Look through that list and find only the images

  // take all the images and create an option object out of each

}