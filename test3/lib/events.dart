import 'package:flutter/material.dart';
import 'brands.dart';
import 'main.dart';
import 'events.dart';
import 'brand_product.dart';
//void main() => runApp(new MyApp());

class Events extends StatefulWidget {
  @override
  createState() => new _EventsState();
}

List _brands = [
  '3 GENERATION',
  'Allure',
  'Crescent',
  'Dome Disc set',
  'Embrace Necklace Sets',
  'Embrace',
  'Fiori',
  'Frama',
  'Glambangs',
  'Glide Star'
];

class _EventsState extends State<Events> with SingleTickerProviderStateMixin {
  String _newText = "Screen 2 Add widgets here.........";
  void _iconTapped(String value) {
    setState(() {
      _newText = value;
    });
  }

  TabController _controller;

  //bool _customIndicator = false;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: 1, initialIndex: 0);
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
                  _iconTapped("Contact us");
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
    return new Scaffold(
        //AppBar(),

        appBar: new AppBar(
          title: _appBarLayout(),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.search),
              color: Colors.white,
              tooltip: 'Search',
              onPressed: () {
                _iconTapped("search");
              },
            ),
            new IconButton(
              icon: new Icon(Icons.library_books),
              tooltip: 'Quotes',
              color: Colors.white,
              onPressed: () {
                _iconTapped("Quotes");
              },
            )
          ],
        ),
        drawer: new Drawer(
          child: _menuLayout(),
        ),
        body: new CustomScrollView(slivers: <Widget>[
          const SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              title: const Text("Upcoming Events"),
            ),
          ),
          new SliverFixedExtentList(
            itemExtent: MediaQuery.of(context).size.width / 2.2,
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return new GestureDetector(
                    onTap: () {
                      print(_brands[index] + ' Image Tapped!  -> $index');
                    },
                    child: new Card(
                        margin: const EdgeInsets.all(5.0),
                        child: new Column(
                          children: [
                            new Image.network(
                                "https://personalproject1.000webhostapp.com/images/product/SR-BR-112247..jpg",
                                height: MediaQuery.of(context).size.width / 2.5,
                                width: MediaQuery.of(context).size.width - 10,
                                fit: BoxFit.contain),
                          ],
                        )));
              },
              childCount: 4,
            ),
          )
        ])

        /*new ListView.builder(
          itemCount: _brands.length,
          itemBuilder: (BuildContext context, int index) {
            return new GestureDetector(
                onTap: () {
                  print(_brands[index] + ' Image Tapped!  -> $index');
                },
                child: new Card(
                    margin: const EdgeInsets.all(5.0),
                    child: new Column(
                      children: [
                        new Image.network(
                            "https://personalproject1.000webhostapp.com/images/product/SR-BR-112247..jpg",
                            height: MediaQuery.of(context).size.width / 2.5,
                            width: MediaQuery.of(context).size.width - 10,
                            fit: BoxFit.contain),
                      ],
                    )));
          },
        )
        */

        );
  }
}
