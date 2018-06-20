import 'package:flutter/material.dart';
import 'package:image_carousel/image_carousel.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new ImageCarousel(
  <ImageProvider>[ 
    new NetworkImage('http://www.hilversum.ferraridealers.com/siteasset/ferraridealer/54f07ac8c35b6/961/420/selected/0/0/0/54f07ac8c35b6.jpg'),
    new NetworkImage('http://auto.ferrari.com/en_EN/wp-content/uploads/sites/5/2017/08/ferrari-portofino-reveal-2017-featured-new.jpg'),
    new NetworkImage('http://www.hilversum.ferraridealers.com/siteasset/ferraridealer/54f07ac8c35b6/961/420/selected/0/0/0/54f07ac8c35b6.jpg'),
  ],
  interval: new Duration(seconds: 1),
),
    );
  }
}