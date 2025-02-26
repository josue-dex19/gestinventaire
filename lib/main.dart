import 'package:flutter/material.dart';
import 'package:gestinventaire/viewmodels/product_view_models.dart';
import 'package:gestinventaire/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ProductViewModels())],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  ));
}
