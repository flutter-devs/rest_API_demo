import 'package:flutter/material.dart';
import 'dart:async';
import 'fruit.dart';
import 'fruitList.dart';
import 'operation.dart';

void main() => runApp(MyApp(products: fetchFruit()));

class MyApp extends StatelessWidget {
  final Future<List<Fruit>> products;

  MyApp({this.products});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(products: products),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Future<List<Fruit>> products;

  MyHomePage({this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Rest API Demo"),
          backgroundColor: Colors.cyan,
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<List<Fruit>>(
            future: products,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? FruitList(items: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
