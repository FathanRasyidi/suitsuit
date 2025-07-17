import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'apiProvider.dart';
import 'First.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApiProvider(),
      child: MaterialApp(
        title: 'Suitmedia App',
        home: FirstPage(),
      ),
    );
  }
}