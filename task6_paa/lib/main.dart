import 'package:flutter/material.dart';
import 'package:task6_paa/view/berita.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modul 6 PAA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BeritaPage(),
    );
  }
}



