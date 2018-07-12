import 'package:flutter/material.dart';
import 'Menu.dart';

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
        title: Menu.appBarLayoutMain(context),
      ),
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverToBoxAdapter(
            child: new Container(
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.black26)),
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
                    child: new Text(
                      "Customer reviews",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new Row(
                      children: <Widget>[
                        new Icon(Icons.star),
                        new Icon(Icons.star),
                        new Icon(Icons.star),
                        new Icon(Icons.star),
                        new Icon(Icons.star_half),
                        new Text("\t\r2",
                            style: TextStyle(
                              fontSize: 22.0,
                            )),
                      ],
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new Text("4.5 out of 5 Stars",
                        style: TextStyle(fontSize: 18.0)),
                  ),
                ],
              ),
            ),
          ),
          new SliverToBoxAdapter(
            child: new Column(
              children: _reviews.map((_ReviewPage _review) {
                return new Container(
                  //decoration: new BoxDecoration(border: new Border.all(color: Colors.black26)),
                  //width: MediaQuery.of(context).size.width / 1.25,
                  //color: Colors.black12,
                  padding: const EdgeInsets.all(15.0),
                  margin: const EdgeInsets.only(top: 5.0, right: 10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new Icon(Icons.person),
                            new Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: new Text(_review.name,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.left),
                            ),
                          ],
                        ),
                        new Row(
                          children: _getStar(_review.star),
                        ),
                        new Text("Reviewed on 10/03/2018"),
                        new Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: new Text(_review.text,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left),
                        ),
                        new Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: new Text("2 person found this helpful",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w300))),
                        new Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: new Container(
                                width: MediaQuery.of(context).size.width / 1.6,
                                child: new Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    new RaisedButton(
                                      onPressed: () {
                                        print("object");
                                      },
                                      color: Colors.white70,
                                      child: new Text("Helpful"),
                                    ),
                                    new RaisedButton(
                                      onPressed: () {
                                        print("object");
                                      },
                                      color: Colors.white70,
                                      child: new Text("Not Helpful"),
                                    )
                                  ],
                                )))
                      ]),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
