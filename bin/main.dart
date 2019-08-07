import 'dart:io';
import 'package:prompter_qh/prompter_qh.dart';

void main() {
  final prompter = new Prompter();

  final bool choice = prompter.askBinary('Are you here to convert an image?');
  if (!choice) {
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
  return Directory.current.listSync().where((entity) {
    return FileSystemEntity.isFileSync(entity.path) &&
        entity.path.contains(new RegExp(r'\.(png|jpg|jpeg)'));
  }).map((entity) {
    final filename = entity.path.split(Platform.pathSeparator).last;
    return new Option(filename, entity);
  }).toList();
}
