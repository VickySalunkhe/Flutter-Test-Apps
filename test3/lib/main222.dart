import 'package:flutter/material.dart';
//import 'package:image_carousel/image_carousel.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliver Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

/*
Widget testBGCarousel = new Container(
    child: new Carousel(
      children: [
          
        new Image.network("http://lorempixel.com/output/abstract-q-c-1920-1080-8.jpg",width: 1500.0, height: 1500.0, fit: BoxFit.cover),
        new Image.network("http://lorempixel.com/output/abstract-q-c-1920-1080-8.jpg",width: 1500.0, height: 1500.0, fit: BoxFit.cover),
        new Image.network("http://lorempixel.com/output/abstract-q-c-1920-1080-8.jpg",width: 1500.0, height: 1500.0, fit: BoxFit.cover),
      ].toList(),
      displayDuration: const Duration(seconds: 1),
    ),
  );
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver Example'),
      ),
      body: 
     /*  Container(
                child: new ImageCarousel(
  <ImageProvider>[
    new NetworkImage('http://www.hilversum.ferraridealers.com/siteasset/ferraridealer/54f07ac8c35b6/961/420/selected/0/0/0/54f07ac8c35b6.jpg'),
    new NetworkImage('http://auto.ferrari.com/en_EN/wp-content/uploads/sites/5/2017/08/ferrari-portofino-reveal-2017-featured-new.jpg'),
    new NetworkImage('http://www.hilversum.ferraridealers.com/siteasset/ferraridealer/54f07ac8c35b6/961/420/selected/0/0/0/54f07ac8c35b6.jpg'),
  ],
  interval: new Duration(seconds: 1),
));
   */   new CustomScrollView(
        slivers: <Widget>[
          /*SliverAppBar(
            title: Text(
              'Sliver App Bar',
            ),
            floating: true,
            // pinned: true,
            centerTitle: true,
            elevation: 10.0,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'http://lorempixel.com/output/abstract-q-c-1920-1080-8.jpg',
                fit: BoxFit.cover,
              ),
              title: Text('Spacebar Title'),
            ),
          ),
          */
         
        /*  SliverFixedExtentList(
            itemExtent: MediaQuery.of(context).size.width / 3.2,
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              MainAxisSize.min;
               return new 
              /*Container(
                alignment: Alignment.topLeft,
                child: new ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return new Container(
                      
                      padding: const EdgeInsets.only(right:5.0),
                      child: new Image.network(
                        'http://lorempixel.com/output/abstract-q-c-1920-1080-8.jpg',
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                      
                    );
                  },
                ),
              );
              */
            }, childCount: 1),
          ),
          */
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width/2,
              //crossAxisCount: 2,
              //childAspectRatio: 1.52,
              
              childAspectRatio: 1.49,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(4.0),
                child: new Column(
                  children: <Widget>[
                    new Image.network(
                        "http://lorempixel.com/output/abstract-q-c-1920-1080-8.jpg",
                        width: MediaQuery.of(context).size.width / 2,
                        fit: BoxFit.fill),
                    new Text(
                      "data",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              );
            }, childCount: 4),
          ),
          SliverFixedExtentList(
            itemExtent: 40.0,
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return new RaisedButton(
                onPressed: () {
                  final snackBar = new SnackBar(
                    content: new Text('Yay! A SnackBar!'),
                    action: new SnackBarAction(
                      label: 'Undo',
                      onPressed: () {},
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
                child: new ListTile(
                  title: new Text("View All Brands"),
                  trailing: new Icon(Icons.keyboard_arrow_right),
                ),
                color: Colors.white,
              );
            }, childCount: 1),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            
            // delegate: SliverChildListDelegate([
            //   Text('1'),
            //   Text('2'),
            //   Text('3'),
            //   Text('4'),
            // ]),

            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
            
              return Container(
                alignment: Alignment.center,
                color: Colors.indigo[100 * (index % 9)],
                child: Text('List Item: $index'),
              );
          },childCount:10,),
          )
        ],
      ),

    );
  }
}
