import 'package:flutter/material.dart';
//import 'package:test2/brands.dart';
import 'main.dart';
import 'events.dart';
import 'brand_product.dart';
import 'menuLayout.dart';

class Brands extends StatefulWidget {
  @override
  _BrandsMainBodyState createState() => new _BrandsMainBodyState();
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

class _BrandsMainBodyState extends State<Brands> {


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
                  //_iconTapped("Contact us");
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
        url = "https://personalproject1.000webhostapp.com/new/embrace1_rc.png";
       break;
     case 1:
        url = "https://personalproject1.000webhostapp.com/new/embrace_rc.png";
       break;
     case 2:
        url = "https://personalproject1.000webhostapp.com/new/monalisa1_rc.png";
       break;    
     case 3:
        url = "https://personalproject1.000webhostapp.com/new/monalisa_rc.png";
       break;  
     case 4:
        url = "https://personalproject1.000webhostapp.com/new/dazzle_rc.png";
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
             // _iconTapped("search");
            },
          ),
          new IconButton(
            icon: new Icon(Icons.library_books),
            tooltip: 'Quotes',
            color: Colors.white,
            onPressed: () {
             // _iconTapped("Quotes");
            },
          )
        ],
      ),
      drawer: new Drawer(
        child: MenuLayout.menuLayout1(context),
      ),
      body: new CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              title: const Text("Brands"),
            ),
          ),
          new SliverFixedExtentList(
              itemExtent: MediaQuery.of(context).size.width / 2.2,
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new GestureDetector(
                      onTap: () {
                        print(_brands[index] + ' Image Tapped!  -> $index');
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new BrandProducts(index)),
                        );
                      },
                      child: new Card(
                        
                        child: new Image.network(
                          _getimgsource(index)
                          ,
                          height: MediaQuery.of(context).size.width / 2.5,
                          width: MediaQuery.of(context).size.width - 10,
                          fit: BoxFit.fitWidth,
                        ),
                      ));
                },childCount: _brands.length, 
              )),
        ],
      ),
    );
  }
}
