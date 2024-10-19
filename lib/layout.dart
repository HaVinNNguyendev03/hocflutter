import 'package:flutter/material.dart';
import 'package:hocflutter/productboxlayout.dart';
class Layout extends StatefulWidget {
   const Layout({super.key});
   @override 
   State<Layout> createState()  => _LayoutState();
}
class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products list")),
      body : ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          ProductBox(
            name: "Iphone",
            description: "Dien thoai thong minh",
            price: 9999999,
            image: "iphone.jpg",
          ),
          ProductBox(
            name: "laptop",
            description: "laptop hien dai",
            price: 70000,
            image: "laptop.jpg",
          ),
          ProductBox(
            name: "pixel",
            description: "man hinh full hd",
            price: 4000,
            image: "pixel.jpg",
          ),
          ProductBox(
            name: "tablet",
            description: "tablet thong minh",
            price: 123456,
            image: "tablet.jpg",
          ),
          ProductBox(
            name: "tablet",
            description: "tablet thong minh",
            price: 123456,
            image: "tablet.jpg",
          ),
          ProductBox(
            name: "tablet",
            description: "tablet thong minh",
            price: 123456,
            image: "tablet.jpg",
          ),
          ProductBox(
            name: "tablet",
            description: "tablet thong minh",
            price: 123456,
            image: "tablet.jpg",
          )
        ],
      )
    );
  }
}