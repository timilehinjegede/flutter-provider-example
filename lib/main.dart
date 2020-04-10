import 'package:flutter/material.dart';
import 'package:flutterprovider/model/cart.dart';
import 'package:provider/provider.dart';
import 'screens/catalog.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCatalog(),
    );
  }
}
