import 'package:flutter/material.dart';

class stack extends StatefulWidget {
  @override
  _stackState createState() => _stackState();
}

class _stackState extends State<stack> {
  // bool _checkboxValue = false;
  // int _radioValue = 0;
  // bool _switchValue = false;
  // double _sliderValue = 0.5;
  // String _selectedDropdownValue = 'Option 1';
  // TimeOfDay _selectedTime = TimeOfDay.now();
  // DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
        child: Stack(
  children: [
    Container(
      width: 200,
      height: 200,
      color: Colors.green,
    ),
    Positioned(
      top: 50,
      left: 50,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.yellow,
      ),
    ),
    Positioned(
      bottom: 10,
      right: 10,
      child: Text('Stacked Text'),
    ),
  ],
)

       )
    );
  }
}
