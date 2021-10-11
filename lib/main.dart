import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'home.dart';

void main() {
  runApp(const FooderlichApp());
}

class FooderlichApp extends StatelessWidget {
  const FooderlichApp({Key? key}) : super(key: key);

  static const title = 'Fooderlich';

  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();
    return MaterialApp(
      title: title,
      theme: theme,
      home: const HomePage(),
    );
  }
}
