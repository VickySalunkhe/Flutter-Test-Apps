import 'package:flutter/material.dart';
//import 'package:image_carousel/image_carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
      body: new CarouselSlider(
  items: [1,2,3,4,5].map((i) {
    return new Builder(   
      builder: (BuildContext context) {
        return new Container(
          width: MediaQuery.of(context).size.width,
          margin: new EdgeInsets.symmetric(horizontal: 5.0),
          decoration: new BoxDecoration(
            color: Colors.amber  
          ),
          child: new Text('text $i', style: new TextStyle(fontSize: 16.0),)
        );
      },
    );
  }).toList(), 
  height: MediaQuery.of(context).size.width/2,
  //width: MediaQuery.of(context).size.width-20.0,
  autoPlay: true,
autoPlayDuration: Duration(milliseconds: 5000) ,
)
      
      
      /* new ImageCarousel(
  <ImageProvider>[ 
       
    new NetworkImage('https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
    new NetworkImage('https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
    new NetworkImage('https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'),
  ],
  interval: new Duration(milliseconds: 50000),
),

*/
    );
  }
}