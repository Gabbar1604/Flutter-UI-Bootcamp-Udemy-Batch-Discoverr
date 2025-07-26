import 'package:discoverr/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TravelDiscoveryApp());
}

class TravelDiscoveryApp extends StatelessWidget {
  const TravelDiscoveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Discovery',
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Roboto'),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
