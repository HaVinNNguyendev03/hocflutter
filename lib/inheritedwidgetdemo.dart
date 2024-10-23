import 'package:flutter/material.dart';
import 'package:meta/meta.dart';



// Tạo một InheritedWidget để thay đổi dependencies
class ExampleInheritedWidget extends InheritedWidget {
  final String data;

  const ExampleInheritedWidget({
    Key? key,
    required this.child,
    this.data = 'Default',  // Giá trị mặc định
  }) : super(key: key, child: child);

  final Widget child;

  static ExampleInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ExampleInheritedWidget>();
  }

  @override
  bool updateShouldNotify(ExampleInheritedWidget oldWidget) {
    return oldWidget.data != data;
  }
}


