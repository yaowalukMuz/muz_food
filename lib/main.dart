import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // Exlicit
  Widget nameApp = Text('Muz Food');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muz Food',
      home: nameApp,
    );
  }
}
