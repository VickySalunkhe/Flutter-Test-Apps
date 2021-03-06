import 'package:flutter/material.dart';
import 'Menu.dart';
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        //AppBar(),

        appBar: new AppBar(
          title: Menu.appBarLayoutMain(context),
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
          child: Menu.menuLayout(context),
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
            itemExtent: MediaQuery.of(context).size.width / 1.89,
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
                                "https://personalproject1.000webhostapp.com/images/banner/JCK-website-banner-1.png",
                                height:
                                  ((MediaQuery.of(context).size.width ) / 2),
                                 width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover),
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
