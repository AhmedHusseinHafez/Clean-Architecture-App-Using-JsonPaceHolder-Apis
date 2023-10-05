import 'package:clean_architecture_ttd_jsonplaceholder/core/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(CleanArchitectureApp());

class CleanArchitectureApp extends StatelessWidget {
  const CleanArchitectureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      title: 'CleanArchitectureTDD',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Posts"),
        ),
        body: const Center(child: Text("Hello world")),
      ),
    );
  }
}
