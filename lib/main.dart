import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/main_navigation.dart';
import 'features/favorites_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoritesController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: MainNavigation(),
    );
  }
}