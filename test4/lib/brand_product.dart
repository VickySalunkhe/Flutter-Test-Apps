import 'package:flutter/material.dart';
import 'product.dart';
import 'Menu.dart';

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

  BrandProducts(int index0) {
    _index = index0;
  }
  @override
  createState() => new BrandProductsState(_index);
}

class BrandProductsState extends State<BrandProducts>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  BrandProductsState(int index1) {
    _index = index1;
  }
  //bool _customIndicator = false;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(
        vsync: this,
        length: _allPages.length,
        initialIndex: _index == null ? 0 : _index);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final Color iconColor = Theme.of(context).accentColor;
    return new Scaffold(
      appBar: new AppBar(
        title: Menu.appBarLayoutMain(context),
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
        child: Menu.menuLayout(context),
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
                              print(' Image Tapped!  -> $index');
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new ProductDetails()),
                              );
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
