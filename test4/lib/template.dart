import 'package:flutter/material.dart';
import 'Menu.dart';


class ProductDetails extends StatefulWidget {
  static const String routeName = '/material/scrollable-tabs';

  @override
  ProductDetailsState createState() => new ProductDetailsState();
}

class ProductDetailsState extends State<ProductDetails>
    with SingleTickerProviderStateMixin {

 
  @override
  Widget build(BuildContext context) {
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
      ),
      drawer: new Drawer(
        child: Menu.menuLayout(context),
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
          
        ],
      ),
  
    );
  }
}
