import 'package:chapter03/models/models.dart';
import 'package:chapter03/models/tab_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    final theme = FooderlichTheme.light();
    return MaterialApp(
      title: title,
      theme: theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager()),
          ChangeNotifierProvider(create: (context) => GroceryManager()),
        ],
        child: const HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
