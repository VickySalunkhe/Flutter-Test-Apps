import 'package:flutter/material.dart';
//import 'package:test2/brands.dart';
import 'main.dart';

//void main() => runApp(new MyApp());

class Brands extends StatelessWidget {
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
  //        '/Second': (BuildContext context) => new Second(),
        },
        home: new MainBody());
  }
}

class MainBody extends StatefulWidget {
  @override
  createState() => new _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  String _newText = "Screen 2 Add widgets here..........";
  void _iconTapped(String value) {
    setState(() {
      _newText = value;
    });
  }

  /* _menuList(Icon icon1, String text, Icon icon2) {
    return new ListTile(
      leading: icon1,
      title: new Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      trailing: icon2,
    );
  }
*/
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
        new Expanded(
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
        ),
      ],
    );
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
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(children: <Widget>[
          new Text(_newText),
          new RaisedButton(
            child: new Text('Next123'),
            onPressed: 
            () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new MyApp()),
              );
            },
            
          )
        ]),
      ),
    );
  }
}
