import 'package:flutter/material.dart';
import 'package:test3/all_reviews.dart';
import 'brands.dart';
import 'events.dart';
import 'main.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<String> _getdiamonQuality = [
  "VVS1",
  "VVS2",
  "VS1",
  "VS2",
  "S1",
  "S2",
  "I1",
  "I2",
  "I3",
  "Single Cut",
];

List<String> _getkarat = [
  "9 KT",
  "10 KT",
  "14 KT",
  "18 KT",
];
final List<String> productImage = [
  "https://personalproject1.000webhostapp.com/images/product/SR-R-126115..jpg",
  "https://personalproject1.000webhostapp.com/images/product/SR-R-126115..jpg",
  "https://personalproject1.000webhostapp.com/images/product/SR-R-126115..jpg",
  "https://personalproject1.000webhostapp.com/images/product/SR-R-126115..jpg",
];

class _ReviewPage {
  const _ReviewPage({this.text, this.star, this.name});
  final String text, name;
  final int star;
}

const List<_ReviewPage> _reviews = const <_ReviewPage>[
  const _ReviewPage(
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt  ',
      star: 4,
      name: 'Vicky'),
  const _ReviewPage(
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt  ',
      star: 5,
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
  const _CustomizePage({this.pos, this.text});
  final int pos;
  final String text;
}

const List<_CustomizePage> _customizePages = const <_CustomizePage>[
  const _CustomizePage(pos: 0, text: 'Karat'),
  const _CustomizePage(pos: 1, text: 'Diamond Quality'),
  const _CustomizePage(pos: 2, text: 'Colour'),
  const _CustomizePage(pos: 3, text: 'Standard'),
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

  List<String> _getColour = ["White Gold", "Gold", "Rose Gold", "Yellow Gold"];

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

  int _iCount = 0;

  Widget _colour(int _itemCount) {
    return new GridView.builder(
      controller: ScrollController(),
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (BuildContext context, int index) {
        return new Container(
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
                onTap: () {
                  print("Colour Tap, $index  -> " + _getColour[index]);
                },
                child: new Column(children: [
                  new Image.network(
                    "https://personalproject1.000webhostapp.com/images/colour_$index.png",
                    fit: BoxFit.contain,
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: new Text(_getColour[index],
                        textAlign: TextAlign.center),
                  ),
                ])));
      },
      itemCount: _itemCount,
    );
  }

  Widget _karat(int _itemCount) {
    return new Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 22.0, left: 10.0),
        child: new GridView.builder(
          controller: ScrollController(),
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            //   childAspectRatio: 1.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return new GestureDetector(
              onTap: () {
                print("Karat Tap $index -> " + _getkarat[index]);
              },
              child: new Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5.0),
                decoration: new BoxDecoration(
                    border: new Border.all(color: Colors.black26)),
                child: new Text(
                  _getkarat[index],
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            );
          },
          itemCount: _itemCount,
        ));
  }

  Widget _diamond(int _itemCount) {
    return new GridView.builder(
      controller: ScrollController(),
      gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width / 5,
        childAspectRatio: 1.27,
      ),
      itemBuilder: (BuildContext context, int index) {
        return new Container(
            margin: EdgeInsets.only(top: 10.0),
            //padding: const EdgeInsets.only(top:5.0,left:10.0,right:10.0,bottom: 4.0),
            child: new GestureDetector(
                onTap: () {
                  print("Diamond Tap, $index  -> " + _getdiamonQuality[index]);
                },
                child: new Column(children: [
                  new Icon(Icons.ac_unit),
                  new Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: new Text(_getdiamonQuality[index],
                        textAlign: TextAlign.center),
                  ),
                ])));
      },
      itemCount: _itemCount,
    );
  }

  Widget _standard(int _itemCount) {
    return new Container(
        padding: const EdgeInsets.all(10.0),
        child: new GestureDetector(
            onTap: () {
              print("standard Tap, $_itemCount  -> ");
            },
            child: new Column(children: [
              new Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child:
                    const Radio<int>(value: 1, groupValue: 0, onChanged: null),
              ),
              new Text("GH Standard"),
            ])));
  }

  int radioValue = 0;
  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  List<Widget> _getStar(int star) {
    List<Widget> rating = [];
    for (int i = 1; i <= 5; i++) {
      if (i <= star) {
        rating.add(new Icon(Icons.star));
      } else {
        rating.add(new Icon(Icons.star_border));
      }
    }
    return rating;
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
              pinned: false,
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
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(5.0)),
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
                mainAxisSize: MainAxisSize.max,
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
                  new Container(
                    decoration: new BoxDecoration(color: Colors.white10),
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
                    height: MediaQuery.of(context).size.width / 3,
                    child: new TabBarView(
                        controller: _controller,
                        children: _customizePages.map((_CustomizePage _page) {
                          //return new Tab(text: _page.text);
                          switch (_page.pos.toInt()) {
                            case 0:
                              return _karat(_getkarat.length);
                              break;
                            case 1:
                              return _diamond(_getdiamonQuality.length);
                              break;
                            case 2:
                              return _colour(_getColour.length);
                              break;
                            case 3:
                              return _standard(1);
                              break;
                            default:
                              new Text("data");
                          }
                        }).toList()),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Text(
                      "Product Details",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  new Container(
                    height: MediaQuery.of(context).size.width / 1.8,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: new Column(
                      children: _productDetails.map((_ProductDetails _a) {
                        return new Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: new Text(
                                _a.category,
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                            new Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: new Text(
                                _a.value,
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  new GestureDetector(
                      onTap: () {
                        print(' up Review Tapped! ');
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new ReviewPage()),
                        );
                      },
                      child: new Container(
                        decoration: new BoxDecoration(
                            border: new Border.all(color: Colors.black26)),
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.only(
                            top: 10.0, left: 10.0, right: 10.0),
                        child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, bottom: 5.0),
                                    child: new Text(
                                      "2 customer reviews",
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  new Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        new Row(
                                          children: <Widget>[
                                            new Icon(Icons.star),
                                            new Icon(Icons.star),
                                            new Icon(Icons.star),
                                            new Icon(Icons.star),
                                            new Icon(Icons.star_half),
                                          ],
                                        ),
                                        new Text("4.5 out of 5 Stars",
                                            style: TextStyle(fontSize: 18.0)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              new Icon(Icons.keyboard_arrow_right),
                            ]),
                      )),
                  new Container(
                      margin: const EdgeInsets.only(
                          top: 15.0, left: 15.0, right: 15.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text("Top Reviews",
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.left),
                          new Column(
                            children: _reviews.map((_ReviewPage _review) {
                              return new Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    new Row(children: [
                                      new Container(
                                        //decoration: new BoxDecoration(border: new Border.all(color: Colors.black26)),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.26,
                                        //color: Colors.black12,
                                        padding: const EdgeInsets.all(10.0),
                                        margin: const EdgeInsets.only(
                                            top: 5.0, right: 10.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              new Row(
                                                children: <Widget>[
                                                  new Icon(Icons.person),
                                                  new Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: new Text(
                                                        _review.name,
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                        textAlign:
                                                            TextAlign.left),
                                                  ),
                                                ],
                                              ),
                                              new Row(
                                                children:
                                                    _getStar(_review.star),
                                              ),
                                              new Text(_review.text,
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  textAlign: TextAlign.left)
                                            ]),
                                      ),
                                      new Icon(Icons.keyboard_arrow_right)
                                    ])
                                  ]);
                            }).toList(),
                          ),
                        ],
                      )),
                  new Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                      child: new OutlineButton(
                        onPressed: () {
                          print('bottom Review Tapped! ');
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new ReviewPage()),
                          );
                        },
                        borderSide:
                            BorderSide(color: Colors.black26, width: 2.0),
                        child: new ListTile(
                          title: new Text(
                            "Sell all reviews",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w500),
                          ),
                          trailing: new Icon(Icons.keyboard_arrow_right),
                        ),
                      )),
                  new Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, left: 10.0, right: 10.0),
                      child: new OutlineButton(
                        onPressed: () {
                          print("write a review");
                        },
                        borderSide:
                            BorderSide(color: Colors.black26, width: 2.0),
                        child: new ListTile(
                          title: new Text(
                            "Write a review",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w500),
                          ),
                          trailing: new Icon(Icons.keyboard_arrow_right),
                        ),
                      )),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Text(
                      "Related Products",
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
                child: new Container(
                    height: MediaQuery.of(context).size.width / 1.7,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return new GestureDetector(
                            onTap: () {
                              print("Brand Tap, $index");
                            },
                            child: new Container(
                                height: 100.0,
                                child: new Card(
                                    //padding: const EdgeInsets.all(5.0),
                                    margin: const EdgeInsets.all(5.0),
                                    //color: Colors.black38,
                                    child: new Column(
                                      children: <Widget>[
                                        new Image.network(
                                          "https://personalproject1.000webhostapp.com/images/product/SR-R-126115..jpg",
                                          alignment: Alignment.center,
                                          height: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              10,
                                          width: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              10,
                                          //fit:BoxFit.contain
                                        ),
                                        new Text(
                                          "ddasasata",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black87),
                                        ),
                                      ],
                                    ))));
                      },
                    ))),
          ],
        ),
        bottomNavigationBar: new Container(
          height: kBottomNavigationBarHeight,
          width: MediaQuery.of(context).size.width,
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new GestureDetector(
                onTap: () {
                  print("Add to Quote ");
                },
                child: new Container(
                  color: Colors.black12,
                  alignment: Alignment(0.0, 0.0),
                  height: kBottomNavigationBarHeight,
                  width: MediaQuery.of(context).size.width / 2,
                  child: new Text("Add to Quote",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              new GestureDetector(
                  onTap: () {
                    print("Quote Now");
                  },
                  child: new Container(
                    color: Colors.black,
                    alignment: Alignment(0.0, 0.0),
                    height: kBottomNavigationBarHeight,
                    width: MediaQuery.of(context).size.width / 2,
                    child: new Text("Quote Now",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ))
            ],
          ),
        ));
  }
}



/*



*/



/*

Container(
        color: Colors.black,
        padding: new EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
                    decoration: new BoxDecoration(color: Colors.black),
                    child: new TabBar(
                        labelColor: Colors.white, 
                        indicatorWeight: 4.0,
                        indicatorColor: Colors.white70,
                        controller: _controller,
                        isScrollable: true,
                        labelStyle: TextStyle(fontSize: 16.0), 
                        tabs: _customizePages.map((_CustomizePage _page) {
                          return new Tab(text: _page.text);
                        }).toList()),
                  ),  
                  new Container(
                    height: MediaQuery.of(context).size.width, 
                    child: new TabBarView(
                        controller: _controller,
                        children: _customizePages.map((_CustomizePage _page) {
                          //return new Tab(text: _page.text);
                          switch (_page.pos.toInt()) {
                            case 0:
                              return TextFormFieldDemo();
                              break;
                            case 1:
                              return _login();
                              break;
                            default:
                              new Text("data");
                          }
                        }).toList()),
                  ),
          ],
        ),
      ),


*/ 