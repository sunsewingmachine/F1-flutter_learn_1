import 'package:flutter/material.dart';

int _count  = 10;

void main() => runApp(const MainApp());
 
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('AppBar Title: $_count'),
          backgroundColor: Colors.blue[300],
        ),
        body: BodyContainer(),
      )
    );  
  }
}

 class BodyContainer extends StatefulWidget {
    const BodyContainer({ super.key });

    @override
    State<BodyContainer> createState() => _BodyContainerState();
}

class _BodyContainerState extends State<BodyContainer> {
 
   @override
   Widget build(BuildContext context){
     // ignore: prefer_const_constructors
     return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
          Text('Count in BodyContainer: $_count', style: TextStyle(fontSize: 30)),
          FirstWidget(),
          SecondText(),
        ]
        )
        );
     }
}

class FirstWidget extends StatefulWidget {
  const FirstWidget({ Key? key }) : super(key: key);

  @override
  _FirstWidgetState createState() => _FirstWidgetState();
}

class _FirstWidgetState extends State<FirstWidget> {
  
  void newMethod() {
    _count = _count + 1;    
    setState(() {
      _count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
             child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: <Widget>[
              Text('Count in First Widget: $_count', style: const TextStyle(fontSize: 30),),
              Text('Count Duplicate in First Widget: $_count', style: const TextStyle(fontSize: 30)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: newMethod,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Increment Count', style: TextStyle(fontSize: 30)),
                ),
              )
            ],
          ),
        );
  }
}

class SecondText extends StatefulWidget {
  const SecondText({ Key? key }) : super(key: key);

  @override
  _SecondTextState createState() => _SecondTextState();
}


class _SecondTextState extends State<SecondText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Second Count: $_count', style: TextStyle(fontSize: 35, color:  Color.fromARGB(255, 255, 0, 0)),)
    );
  }
}


// end  