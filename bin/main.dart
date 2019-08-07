import 'dart:io';
import 'package:prompter_qh/prompter_qh.dart';

void main() {
  final prompter = new Prompter();

  final bool choice = prompter.askBinary('Are you here to convert an image?');
  if(!choice) {
    exit(0);
  }
}