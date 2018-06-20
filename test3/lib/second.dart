import 'package:flutter/material.dart';
import 'brands.dart';
import 'events.dart';
import 'main.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> productImage = [
  "https://personalproject1.000webhostapp.com/images/product/SR-R-126115..jpg",
  "https://personalproject1.000webhostapp.com/images/product/SR-R-126115..jpg",
  "https://personalproject1.000webhostapp.com/images/product/SR-R-126115..jpg",
  "https://personalproject1.000webhostapp.com/images/product/SR-R-126115..jpg",
];

class _ReviewPage {
  const _ReviewPage({this.text, this.star, this.name});
  final String text, name;
  final double star;
}

const List<_ReviewPage> _reviews = const <_ReviewPage>[
  const _ReviewPage(
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt  ',
      star: 4.5,
      name: 'Vicky'),
  const _ReviewPage(
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt  ',
      star: 5.0,
      name: 'Vipul'),
];

class _ProductDetails {
  const _ProductDetails({this.category, this.value});
  final String category, value;
}

const List<_ProductDetails> _productDetails = const <_ProductDetails>[
  const _ProductDetails(category: "Purity", value: "18 KT"),
  const _ProductDetails(category: "Gold Colour", value: "Y, P, G"),
  const _ProductDetails(category: "Gold-wt-gms", value: "8.2 grams"),
  const _ProductDetails(category: "Diam-wt-cts", value: "1.3 grams"),
  const _ProductDetails(category: "Diamond Quality", value: "VS1 - VS2"),
  const _ProductDetails(category: "Diamond Colour", value: "G-H Colour"),
];

class _CustomizePage {
  const _CustomizePage({this.text});
  
  final String text;
}

const List<_CustomizePage> _customizePages = const <_CustomizePage>[
  const _CustomizePage(text: 'Karat'),
  const _CustomizePage(text: 'Diamond Quality'),
  const _CustomizePage(text: 'Colour'),
  const _CustomizePage(text: 'Standard'),
];

class ProductDetails extends StatefulWidget {
  static const String routeName = '/material/scrollable-tabs';

  @override
  ProductDetailsState createState() => new ProductDetailsState();
}

class ProductDetailsState extends State<ProductDetails>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(
        vsync: this, length: _customizePages.length, initialIndex: 0);
  }

  String _getColour(int index){
    String name;
    switch (index) {
      case 0: name="White Gold";
        break;
      case 1: name="Gold";
        break;
      case 2: name="Rose Gold";
        break;
      case 3: name="Yellow Gold";
        break;
      default:
    }
    return name;
  }

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
                  print("Contact us");
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
          onTap: () {
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: _appBarLayout(),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            color: Colors.white,
            tooltip: 'Search',
            onPressed: () {
              print("search");
            },
          ),
          new IconButton(
            icon: new Icon(Icons.library_books),
            tooltip: 'Quotes',
            color: Colors.white,
            onPressed: () {
              print("Quotes");
            },
          )
        ],
      ),
      drawer: new Drawer(
        child: _menuLayout(),
      ),
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              centerTitle: true,
              title: new Text("E-116209 Y-TT"),
            ),
          ),
          new SliverToBoxAdapter(
            child: new Stack(
              alignment: const Alignment(0.95, -0.9),
              children: <Widget>[
                new Container(
                  child: new CarouselSlider(
                    items: productImage.map((url) {
                      return new Container(
                        //color: Colors.black,
                        padding: const EdgeInsets.only(top: 5.0),
                        margin: new EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: new BoxDecoration(
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(5.0)),
                            image: new DecorationImage(
                                image: new NetworkImage(url),
                                fit: BoxFit.contain)),
                      );
                    }).toList(),
                    viewportFraction: 0.5,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    interval: Duration(milliseconds: 5000),
                    autoPlay: true,
                    autoPlayDuration: Duration(milliseconds: 800),
                    aspectRatio: 2.0,
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: new BoxDecoration(
                      color: new Color.fromARGB(200, 255, 255, 255)),
                  child: new GestureDetector(
                    onTap: () {
                      print("Share Button");
                    },
                    child: new Icon(Icons.share,
                        color: Colors.black87, size: 36.0),
                  ),
                ),
              ],
            ),
          ),
          new SliverToBoxAdapter(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Text(
                    "Customize this product",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          new SliverToBoxAdapter(
              child: new Column(
                mainAxisSize: MainAxisSize.max, 
            children: <Widget>[
              new Container(
                decoration:
                    new BoxDecoration(color: Colors.white10),
                child: new TabBar(
                    labelColor: Colors.black87,
                    indicatorWeight: 4.0,
                    indicatorColor: Colors.black,
                    controller: _controller,
                    isScrollable: true,
                    labelStyle: TextStyle(fontSize: 16.0),
                    tabs: _customizePages.map((_CustomizePage _page) {
                      return new Tab(text: _page.text);
                    }).toList()),
              ),
              new Container(
                height: MediaQuery.of(context).size.width/2.5,
                child: new TabBarView(
                    controller: _controller,
                    children: _customizePages.map((_CustomizePage _page) {
                      //return new Tab(text: _page.text);
                      return new GridView.builder(
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                childAspectRatio: 0.65,
                            ),
                        itemBuilder: (BuildContext context, int index) {
                          return new Container(
                              padding: const EdgeInsets.all(10.0),
                              child: new GestureDetector(
                                  onTap: () {
                                    print("Colour Tap, $index  -> "+_getColour(index));
                                  },
                              child: new Column(
                                children: [
                                  new Image.network("https://personalproject1.000webhostapp.com/images/colour_$index.png",
                                  fit: BoxFit.contain,),
                                  new Padding(
                                    padding: const EdgeInsets.only(top: 5.0), 
                                    child: new Text(_getColour(index),textAlign: TextAlign.center),
                                  ),
                                ]
                              )));
                        },
                        itemCount: 4,
                      );
                    }).toList()),
              )
            ],
          )),
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
                    },
                    child: new Card(
                        //padding: const EdgeInsets.all(5.0),
                        margin: const EdgeInsets.all(5.0),
                        //color: Colors.black38,
                        child: new Column(
                          children: <Widget>[
                            new Image.network(
                              "https://personalproject1.000webhostapp.com/images/product/SR-R-126115..jpg",
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
              childCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}
