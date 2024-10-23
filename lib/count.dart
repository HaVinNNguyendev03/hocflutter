import 'package:flutter/material.dart';

class Count extends StatefulWidget {
  Count({super.key});

  @override
  State<Count> createState() => _CountState();
}
class _CountState extends State<Count> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context){
    return Column(  
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Dem so:$_counter'),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: Text('Click me!'),
        )
      ],
    );
  }
}