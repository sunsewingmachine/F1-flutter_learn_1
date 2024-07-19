// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_learn_1/main.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});


  @override
  Widget build(BuildContext context) {

    var appState = context.watch<MyAppState>();
    if(appState.favorites.isEmpty){
      return Center(
        child: Text('No favorites yet'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('New Page'),
      ),
      body: ListView(
        children: 
        appState.favorites.map((pair) {
          return ListTile(
            title: Text(pair.asCamelCase),
            leading: Icon(Icons.favorite),
          );
        }).toList(),
      )
      );
      
  }
}
