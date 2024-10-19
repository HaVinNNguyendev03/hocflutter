import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  bool _checkboxValue = false;
  int _radioValue = 0;
  bool _switchValue = false;
  double _sliderValue = 0.5;
  String _selectedDropdownValue = 'Option 1';
  TimeOfDay _selectedTime = TimeOfDay.now();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widgets Example'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TabBar and TabBarView Example
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'Tab 1'),
                      Tab(text: 'Tab 2'),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    child: TabBarView(
                      children: [
                        Center(child: Text('Tab 1 Content')),
                        Center(child: Text('Tab 2 Content')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // ListTile Example
            ListTile(
              leading: Icon(Icons.info),
              title: Text('This is a ListTile'),
              subtitle: Text('Subtitle text'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            // Button Examples
            // RaisedButton(
            //   onPressed: () {},
            //   child: Text('RaisedButton (ElevatedButton)'),
            // ),
            // FlatButton(
            //   onPressed: () {},
            //   child: Text('FlatButton (TextButton)'),
            // ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {},
            ),
            DropdownButton<String>(
              value: _selectedDropdownValue,
              onChanged: (newValue) {
                setState(() {
                  _selectedDropdownValue = newValue!;
                });
              },
              items: [
                DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
                DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
              ],
            ),
            PopupMenuButton<String>(
              onSelected: (value) {},
              itemBuilder: (BuildContext context) {
                return ['Option 1', 'Option 2']
                    .map((choice) => PopupMenuItem(
                          value: choice,
                          child: Text(choice),
                        ))
                    .toList();
              },
            ),
            ButtonBar(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Button 1')),
                ElevatedButton(onPressed: () {}, child: Text('Button 2')),
              ],
            ),
            // TextField Example
            TextField(
              decoration: InputDecoration(labelText: 'Enter your text'),
            ),
            // Checkbox Example
            Checkbox(
              value: _checkboxValue,
              onChanged: (bool? value) {
                setState(() {
                  _checkboxValue = value!;
                });
              },
            ),
            // Radio Example
            Column(
              children: List.generate(3, (index) {
                return Radio<int>(
                  value: index,
                  groupValue: _radioValue,
                  onChanged: (int? value) {
                    setState(() {
                      _radioValue = value!;
                    });
                  },
                );
              }),
            ),
            // Switch Example
            Switch(
              value: _switchValue,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
            // Slider Example
            Slider(
              value: _sliderValue,
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            // Date & Time Pickers Example
            ElevatedButton(
              onPressed: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != _selectedDate) {
                  setState(() {
                    _selectedDate = picked;
                  });
                }
              },
              child: Text('Select Date'),
            ),
            ElevatedButton(
              onPressed: () async {
                TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: _selectedTime,
                );
                if (picked != null && picked != _selectedTime) {
                  setState(() {
                    _selectedTime = picked;
                  });
                }
              },
              child: Text('Select Time'),
            ),
            // SimpleDialog Example
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: Text('SimpleDialog'),
                      children: [
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Option 1'),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Option 2'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Show SimpleDialog'),
            ),
            // AlertDialog Example
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('AlertDialog'),
                      content: Text('This is an alert dialog'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Show AlertDialog'),
            ),
          ],
        ),
      ),
    );
  }
}
