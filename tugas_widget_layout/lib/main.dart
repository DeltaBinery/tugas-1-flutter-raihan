import 'package:flutter/material.dart';

import 'pricing_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(title: Text("Tugas Mandiri Widget & Layouting")),
        body: PricingCard(),
      ),
    );
  }
}
