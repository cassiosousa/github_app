import 'package:flutter/material.dart';
import 'package:github_app/core/inject/inject.dart';
import 'package:github_app/core/presentation/ui/app.dart';

void main() {
  Inject.initialize();
  runApp(const GitHubApp());
}