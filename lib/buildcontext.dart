import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // BuildContext ở đây thuộc về HomeScreen, và nó được truyền xuống các widget con
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, World!',
              style: Theme.of(context).textTheme.headlineLarge, 
            ),
            // Truyền context xuống widget con
            MyChildWidget(),
          ],
        ),
      ),
    );
  }
}

class MyChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // BuildContext ở đây là của MyChildWidget, nhưng nó kế thừa từ HomeScreen.
    // Nó có thể truy cập thông tin từ các widget tổ tiên như Scaffold, Theme,...
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'I am a child widget!',
            style: TextStyle(
              fontSize: 24.0,
              color: Theme.of(context).primaryColor, // Truy cập primaryColor từ Theme
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Sử dụng context để truy cập Scaffold đã có từ widget cha và hiển thị Snackbar,bởi vì widget MyChildWidget không có Scaffold.
              ScaffoldMessenger.of(context).showSnackBar( //có thể tạm hiểu ScaffoldMessenger.of(context) là Scaffold của widget HomeScreen.
                SnackBar(content: Text('Button in MyChildWidget pressed!')),
              );
            },
            child: Text('Show SnackBar'),
          ),
        ],
      ),
    );
  }
}
