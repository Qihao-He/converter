import 'dart:io';
import 'package:prompter_qh/prompter_qh.dart';
import 'package:converter/src/converter.dart';

void main() {
  final prompter = new Prompter();

  final bool choice = prompter.askBinary('Are you here to convert an image?');
  if (!choice) {
    exit(0);
  }

  final format = prompter.askMultiple('Select formate:', buildFormatOptions());
  final selectedFile =
      prompter.askMultiple('Select an image to convert:', buildFileOptions());
  final newPath = convertImage(selectedFile, format);

  final shouldOpen = prompter.askBinary('Open the Image?');

  if (shouldOpen) {
    Process.run('open', [newPath]);
  }
}

List<Option> buildFormatOptions() {
  return [
    new Option('Convert to jpeg', 'jpeg'),
    new Option('Convert to png', 'png'),
  ];
}

List<Option> buildFileOptions() {
  return Directory.current.listSync().where((entity) {
    return FileSystemEntity.isFileSync(entity.path) &&
        entity.path.contains(new RegExp(r'\.(png|jpg|jpeg)'));
  }).map((entity) {
    final filename = entity.path.split(Platform.pathSeparator).last;
    return new Option(filename, entity);
  }).toList();
}
