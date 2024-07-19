import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart'; // Import the Counter model

class CounterProviderPage extends StatelessWidget {
  const CounterProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: const CounterProviderHomePage(),
    );
  }
}

final class CounterProviderHomePage extends StatelessWidget {
  const CounterProviderHomePage({super.key});

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
            const SizedBox(height: 30,),
            Text('You have pushed the button this many times:'),
            Text(
              '${counter.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ElevatedButton(
                onPressed: () {
                  counter.increment();
                },
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text('Increment', style: TextStyle(fontSize: 22),),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ElevatedButton(
                onPressed: () {
                  counter.decrement();
                },
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text('Decrement', style: TextStyle(fontSize: 22),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
