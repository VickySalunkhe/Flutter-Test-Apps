import 'package:flutter/material.dart';
import 'brands.dart';
import 'events.dart';
import 'main.dart';

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
  const _ReviewPage(
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt  ',
      star: 3,
      name: 'Vicky'),
  const _ReviewPage(
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt  ',
      star: 3,
      name: 'Vipul'),
  const _ReviewPage(
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt  ',
      star: 4,
      name: 'Vicky'),
  const _ReviewPage(
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt  ',
      star: 2,
      name: 'Vipul'),
];

class ReviewPage extends StatefulWidget {
  static const String routeName = '/material/scrollable-tabs';

  @override
  ReviewPageState createState() => new ReviewPageState();
}

class ReviewPageState extends State<ReviewPage>
    with SingleTickerProviderStateMixin {
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
          
        ],
      ),
    );
  }
}
