import 'package:flutter/material.dart';
import 'brands.dart';
import 'events.dart';
import 'main.dart';
class _Page {
  const _Page({this.text});

  final String text; 
}

const List<_Page> _allPages = const <_Page>[
  const _Page(text: '3 GENERATION'),
  const _Page(text: 'Allure'),
  const _Page(text: 'Crescent'),
  const _Page(text: 'Dome Disc set'),
  const _Page(text: 'Embrace Necklace Sets'),
  const _Page(text: 'Embrace'),
  const _Page(text: 'Fiori'),
  const _Page(text: 'Frama'),
  const _Page(text: 'Glambangs'),
  const _Page(text: 'Glide Star'),
  
];
  int _index;

class BrandProducts extends StatefulWidget {
 // static const String routeName = '/material/scrollable-tabs';
 // BrandProducts(indexValue){}
  
  BrandProducts(int index0){
    _index = index0;
  }
  @override
  createState() => new BrandProductsState(_index);
}

class BrandProductsState extends State<BrandProducts>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  BrandProductsState(int index1){
    _index = index1;
  }
  //bool _customIndicator = false;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: _allPages.length, initialIndex: _index == null?0:_index);
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    //final Color iconColor = Theme.of(context).accentColor;
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
        bottom: new TabBar(
          labelStyle: TextStyle(fontSize: 16.0), 
          controller: _controller,
          isScrollable: true,
          tabs: _allPages.map((_Page page) {
            return new Tab(text: page.text);
          }).toList(),
        ),
      ),
      drawer: new Drawer(
        child: _menuLayout(),
      ),
      body: new TabBarView(
        
          controller: _controller,
          children: _allPages.map((_Page page) {
            return new SafeArea(
              top: false,
              bottom: false,
              child: new CustomScrollView(
                slivers: <Widget>[
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
                                          MediaQuery.of(context).size.width /
                                                  2 -
                                              10,
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          10,
                                      //fit:BoxFit.contain
                                    ),
                                    new Text(
                                      "data",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black87),
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
          }).toList()),
    );
  }
}

