// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_1/bard1.dart';
import 'package:flutter_learn_1/bard2.dart';
import 'package:flutter_learn_1/counter-simple/generator_page.dart';
import 'package:provider/provider.dart';

import 'favorites_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  var selectedIndex = 0;     // ← Add this property.

  @override
  Widget build(BuildContext context) {

    Widget page;

    switch (selectedIndex) {
      case 0: page = Bard1(); break;
      case 1: page = Bard2(); break;
      case 2: page = FavoritesPage(); break;
      case 3: page = GeneratorPage(); break;
      case 4: page = FavoritesPage(); break;

      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }


    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended:  constraints.maxWidth >= 600,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Bard1'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Bard2'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Gpt1'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    print('selected: $value');
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

class BigCard extends StatelessWidget {

  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium?.copyWith(
      color: Colors.amber.shade50
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(pair.asCamelCase, style: style),
      ),
    );
  }
}
