import 'package:flutter/material.dart';
//import 'package:test2/brands.dart';
import 'Menu.dart';
import 'brand_product.dart';

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
        title: Menu.appBarLayoutMain(context),
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
        child: Menu.menuLayout(context),
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
