import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart'; // Import the Counter model

class Bard1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MyHomePage1(),
    );
  }
}

class MyHomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Counter Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text(
              '${counter.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () {
                counter.increment();
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
