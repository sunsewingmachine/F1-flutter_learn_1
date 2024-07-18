import 'package:flutter/material.dart';

void main() => runApp(const Bard1());

class Bard1 extends StatelessWidget {
  const Bard1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('AppBar Title: _count'), // This will not update automatically
          backgroundColor: Colors.blue[300],
        ),
        body: BodyContainer(),
      ),
    );
  }
}

class BodyContainer extends StatefulWidget {
  const BodyContainer({super.key});

  @override
  State<BodyContainer> createState() => _BodyContainerState();
}

class _BodyContainerState extends State<BodyContainer> {
  int _count = 10;

  void incrementCount() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Count in BodyContainer: $_count', style: TextStyle(fontSize: 30)),
          ElevatedButton(
            child: const Text('Increment From BodyContainer', style: TextStyle(fontSize: 30)),   
            onPressed: incrementCount,
          ),
          FirstWidget(count: _count, incrementCount: incrementCount),
          SecondText(count: _count),
        ],
      ),
    );
  }
}

class FirstWidget extends StatelessWidget {
  final int count;
  final VoidCallback incrementCount;

  const FirstWidget({Key? key, required this.count, required this.incrementCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Count in First Widget: $count', style: const TextStyle(fontSize: 30)),
          Text('Count Duplicate in First Widget: $count', style: const TextStyle(fontSize: 30)),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: incrementCount,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
            child: const Text('Increment From FirstWidget', style: TextStyle(fontSize: 30)),   
            ),
          ),
        ],
      ),
    );
  }
}

class SecondText extends StatelessWidget {
  final int count;

  const SecondText({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Second Count: $count', style: TextStyle(fontSize: 35, color: Color.fromARGB(255, 255, 0, 0))),
    );
  }
}
