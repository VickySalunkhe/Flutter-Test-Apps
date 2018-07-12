import 'package:flutter/material.dart';
import 'package:test3/brand_product.dart';
import 'package:test3/login_signup_page.dart';
import 'package:test3/test.dart';
import 'brands.dart';
import 'events.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'product.dart';
import'all_reviews.dart';
import 'intro_screens.dart';


void main() => runApp(new MyApp());

final List<String> imgList = [
  'https://personalproject1.000webhostapp.com/images/banner/JCK-website-banner-1.png',
  'https://personalproject1.000webhostapp.com/images/banner/JCK-website-banner-2.png',
  'https://personalproject1.000webhostapp.com/images/banner/image1s.jpg',
  'https://personalproject1.000webhostapp.com/images/banner/images1.jpg',
  'https://personalproject1.000webhostapp.com/images/banner/ind1ex.jpg',
  'https://personalproject1.000webhostapp.com/images/banner/index.jpg',
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp( 
        title: "appName", 
        theme: new ThemeData(
          primaryColor: Colors.black, 
          accentColor: Colors.cyan[600],
        ),
        routes: <String, WidgetBuilder>{
          '/Home': (BuildContext context) => new MainBody(),
          '/Second': (BuildContext context) => new ProductDetails(),
          '/Review': (BuildContext context) => new TextFormFieldDemo(),
          '/LoginSingup': (BuildContext context) => new LoginSignupPage(),
          '/IntroScreens': (BuildContext context) => new IntroScreens(),

        },  
        home: new LoginSignupPage());// ExpansionPanelsDemo()); //ProductDetails());
  } 
}

class MainBody extends StatefulWidget {
  @override
  createState() => new _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
 
  _menuLayout() {
    return new Container(
        color: Colors.black,
        child: new ListView(
          //padding: EdgeInsets.zero,
          children: [
            new UserAccountsDrawerHeader(
              accountName: new Text("Vicky Salunkhe"),
              accountEmail: new Text("salunkhevicky01@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.blue,
                child: new Text("V"),
              ),
            ),
            new Divider(
              color: Colors.grey,
            ),
            new ListTile(
                leading: new Icon(Icons.info, color: Colors.white),
                title: new Text(
                  "About",
                  style: TextStyle(color: Colors.white),
                ),
                trailing:
                    new Icon(Icons.keyboard_arrow_right, color: Colors.white),
                onTap: () {
                  Navigator.pop(context);
                }),
            new Divider(
              color: Colors.grey,
            ),
            new ListTile(
                leading: new Icon(Icons.brightness_auto, color: Colors.white),
                title: new Text(
                  "Brands",
                  style: TextStyle(color: Colors.white),
                ),
                trailing:
                    new Icon(Icons.keyboard_arrow_right, color: Colors.white),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new Brands()),
                  );
                }),
            new Divider(
              color: Colors.grey,
            ),
            new ListTile(
                leading: new Icon(Icons.event_seat, color: Colors.white),
                title: new Text(
                  "Events",
                  style: TextStyle(color: Colors.white),
                ),
                trailing:
                    new Icon(Icons.keyboard_arrow_right, color: Colors.white),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new Events()),
                  );
                }),
            new Divider(
              color: Colors.grey,
            ),
            new ListTile(
                leading: new Icon(Icons.chat, color: Colors.white),
                title: new Text(
                  "Live Chat",
                  style: TextStyle(color: Colors.white),
                ),
                trailing:
                    new Icon(Icons.keyboard_arrow_right, color: Colors.white),
                onTap: () {
                  Navigator.pop(context);
                }),
            new Divider(
              color: Colors.grey,
            ),
            new ListTile(
                leading: new Icon(Icons.call, color: Colors.white),
                title: new Text(
                  "Contact Us",
                  style: TextStyle(color: Colors.white),
                ),
                trailing:
                    new Icon(Icons.keyboard_arrow_right, color: Colors.white),
                onTap: () {
                  Navigator.pop(context);
                //  _iconTapped("Contact us");
                }),
            new Divider(
              color: Colors.grey,
            ),
          ],
        ));
  }
 
  _appBarLayout() {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        new GestureDetector(
          onTap: (){
            Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new MainBody()),
                  );
          },
        //child: new Expanded(
          child: new Row(
            children: [
              new Container(
                margin:
                    const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
                child: new Image.asset(
                  "images/logo-black.jpg",
                  fit: BoxFit.fitHeight,
                  height: 48.0,
                ),
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Container(
                    child: new Text("Su-Raj",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.amber[500],
                        )),
                  ),
                  new Text('InterGold',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.amber[500],
                      )),
                ],
              ),
            ],
          ),
        //),
      ),
      ],
        
    );
  }

String _getimgsource(int val){
  String url="";

  switch (10 % (val+1)) {
     case 0:
        url = "https://personalproject1.000webhostapp.com/new/embrace1_sq.png";
       break;
     case 1:
        url = "https://personalproject1.000webhostapp.com/new/embrace_sq.png";
       break;
     case 2:
        url = "https://personalproject1.000webhostapp.com/new/monalisa1_sq.png";
       break;    
     case 3:
        url = "https://personalproject1.000webhostapp.com/new/monalisa_sq.png";
       break;  
     case 4:
        url = "https://personalproject1.000webhostapp.com/new/dazzle_sq.png";
       break;      
     
  }
  return url;
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: //AppBar(),
          new AppBar(
        //backgroundColor: Colors.black87,
        title: _appBarLayout(),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            color: Colors.white,
            tooltip: 'Search',
            onPressed: () {
            //  _iconTapped("search");
            },
          ),
          new IconButton(
            icon: new Icon(Icons.library_books),
            tooltip: 'Quotes',
            color: Colors.white,
            onPressed: () {
            //  _iconTapped("Quotes");
            },
          )
        ],
      ),
      drawer: new Drawer(
        child: _menuLayout(),
      ),
      body: new CustomScrollView(
        slivers: <Widget>[
          //Image Carousel
          new SliverFixedExtentList(
            itemExtent: MediaQuery.of(context).size.width / 2.4,
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return new CarouselSlider(
                  items: imgList.map((url) {
                    return new Container(
                      //color: Colors.black,
                      padding: const EdgeInsets.only(top: 5.0),
                      margin: new EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(5.0)),
                          image: new DecorationImage(
                              image: new NetworkImage(url), fit: BoxFit.contain)),
                    );
                  }).toList(),
                  viewportFraction: 0.9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  interval: Duration(milliseconds: 5000),
                  autoPlay: true,
                  autoPlayDuration: Duration(milliseconds: 800),
                  aspectRatio: 2.0,
                );
              },
              childCount: 1,
            ),
          ),
          //Brands Text
           new SliverToBoxAdapter(
                child: new Container(
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: new Text("Popular Brands",textAlign: TextAlign.center,
                  style: TextStyle( fontWeight: FontWeight.w500,fontSize: 18.0),),
                )
          ), 
          //Brands Display 2*2 grid
          new SliverGrid(
            gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
              //mainAxisSpacing: 10.0,
              //crossAxisSpacing: 10.0,
              childAspectRatio: 0.89,
            ),
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return new GestureDetector(
                    onTap: () {
                      print("Brand Tap, $index");
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new BrandProducts(index)),
                        );
                    },
                    child: new Card(
                        //padding: const EdgeInsets.all(5.0),
                        margin: const EdgeInsets.all(5.0),
                        //color: Colors.black38,
                        child: new Column(
                          children: <Widget>[
                            new Image.network(
                              _getimgsource(index),
                              alignment: Alignment.center,
                              height:
                                  MediaQuery.of(context).size.width / 2 - 10,
                              width: MediaQuery.of(context).size.width / 2 - 10,
                              //fit:BoxFit.contain
                            ),
                            new Text(
                              "data",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black87),
                            ),
                          ],
                        )));
              },
              childCount: 4,
            ),
          ),
          //brands button
          new SliverToBoxAdapter(
                child:  new Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new OutlineButton(
                      highlightedBorderColor: Colors.black54,
                      highlightColor: Colors.white30,
                      color: Colors.white,
                      onPressed: () {
                        print("Brand button tap");
                        Navigator.push( 
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Brands()),
                        );
                      },
                      child: new ListTile(
                        title: new Text("View All Brands"),
                        trailing: new Icon(Icons.keyboard_arrow_right),
                      ),
                    ))
          ),
          //events text
           new SliverToBoxAdapter(
                child: new Container(
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: new Text("Upcoming Events",textAlign: TextAlign.center,
                  style: TextStyle( fontWeight: FontWeight.w500,fontSize: 18.0),),
                )
          ),
          //events list 2
          new SliverFixedExtentList(
            itemExtent: (MediaQuery.of(context).size.width - 10.0) / 2,
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return new GestureDetector(
                    onTap: () {
                      print("Event Tap, $index");
                    },
                    child: new Card(
                      margin: const EdgeInsets.all(5.0),
                      //height: size.width/2,
                      //width: size.width,
                      child: new Image.network( 
                          "https://personalproject1.000webhostapp.com/images/banner/JCK-website-banner-1.png",
                          height:
                              ((MediaQuery.of(context).size.width - 10.0) / 2),
                          width: MediaQuery.of(context).size.width - 10.0,
                          fit: BoxFit.cover),
                    ));
              },
              childCount: 2,
            ),
          ),
          //event button
          new SliverToBoxAdapter(
                child:  new Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new OutlineButton(
                      highlightedBorderColor: Colors.black54,
                      highlightColor: Colors.white30,
                      color: Colors.white,
                      onPressed: () {
                        print("Event button tap");
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Events()),
                        );
                      },
                      child: new ListTile(
                        title: new Text("View All Events"),
                        trailing: new Icon(Icons.keyboard_arrow_right),
                      ),
                    ))
          ),
        ],
      ),
    );
  
  }

}
