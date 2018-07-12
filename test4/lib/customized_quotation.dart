import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Menu.dart';

class CustomizedQuotation extends StatefulWidget {
  const CustomizedQuotation({ Key key }) : super(key: key);

  static const String routeName = '/material/text-form-field';

  @override
  CustomizedQuotationState createState() => new CustomizedQuotationState();
}

List<String> _getDiamondQuality = [
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
  List<String> _getColour = ["White Gold", "Gold", "Rose Gold", "Yellow Gold"];

List<String> _getKarat = [
  "9 KT",
  "10 KT",
  "14 KT",
  "18 KT",
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


class CustomizedQuotationForm {
  String name = '';
  String email = '';
  String phoneNumber = '';
  String category = '';
  String image = '';
  String metalWeight = '';   
  String metalColor = '';
  String goldKarat = '';
  String diamondWeight = ''; 
  String ringSize = '';
  String length = '';
  String width = '';
  String instructions = '';
}

class CustomizedQuotationState extends State<CustomizedQuotation> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController _controller;

  CustomizedQuotationForm customizedForm = new CustomizedQuotationForm();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(value)
    ));
  }

@override
  void initState() {
    super.initState();
    _controller = new TabController(
        vsync: this, length: _customizePages.length, initialIndex: 0);
  }

  bool _autovalidate = false;
  bool _formWasEdited = false;

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey = new GlobalKey<FormFieldState<String>>();
  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      showInSnackBar('${customizedForm.name}\'s phone number is ${customizedForm.phoneNumber} and email ${customizedForm.email}');
    }
  }

  String _validateName(String value) {
    _formWasEdited = true;
    if (value.isEmpty)
      return 'Name is required.'; 
    final RegExp nameExp = new RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  String _validateEmail(String value) {
    _formWasEdited = true;
    if (value.isEmpty)
      return 'Email ID is required.';
      final RegExp emailExp = new RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailExp.hasMatch(value))
      return 'Please enter valid emailID.';
    return null;
  }

  String _validatePhoneNumber(String value){
    _formWasEdited = true;
    final RegExp numberExp = new RegExp(r'^[0-9+ ]+$');
      if(!numberExp.hasMatch(value))
        return 'Please enter valid Phone Number.';
      return null;
  }

  Future<bool> _warnUserAboutInvalidData() async {
    final FormState form = _formKey.currentState;
    if (form == null || !_formWasEdited || form.validate())
      return true;

    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: const Text('This form has errors'),
          content: const Text('Really leave this form?'),
          actions: <Widget> [
            new FlatButton(
              child: const Text('YES'),
              onPressed: () { Navigator.of(context).pop(true); },
            ),
            new FlatButton(
              child: const Text('NO'),
              onPressed: () { Navigator.of(context).pop(false); },
            ),
          ],
        );
      },
    ) ?? false;
  }
//////////////////////////////////////////////////////////////////////////////////////////////////  
var selectedValKarat,selectedValQuality,selectedValColour;
_changeSelectedColor(selectedVal,index){
  if(selectedVal==index)
    return Colors.black12;
  else
    return Colors.white;
}
bool allFieldSelected = false;

_checkFields(){
  if(selectedValKarat==null || selectedValQuality==null ||selectedValColour==null)
    allFieldSelected = false;
  else
    allFieldSelected = true;
}

  Widget _colour(int _itemCount) {
    return new GridView.builder(
      controller: ScrollController(),
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (BuildContext context, int index) {
        return new Container(
            color: _changeSelectedColor(selectedValColour,index),
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
                onTap: () {
                  print("Colour Tap, $index  -> " + _getColour[index]);
                  setState(() { selectedValColour = index; });
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
            crossAxisCount: 4,
            //   childAspectRatio: 1.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return new GestureDetector(
              onTap: () {
                print("Karat Tap $index -> " + _getKarat[index]); 
                setState(() { selectedValKarat = index; });
              }, 
              child: new Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5.0),
                decoration: new BoxDecoration(
                    color: _changeSelectedColor(selectedValKarat,index),
                    border: new Border.all(color: Colors.black26)),
                child: new Text(
                  _getKarat[index],
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
        childAspectRatio: 1.2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return new Container(
            color: _changeSelectedColor(selectedValQuality,index),
            margin: EdgeInsets.only(top: 10.0),
            //padding: const EdgeInsets.only(top:5.0,left:10.0,right:10.0,bottom: 4.0),
            child: new GestureDetector(
                onTap: () {
                  print("Diamond Tap, $index  -> " + _getDiamondQuality[index]);
                  setState(() { selectedValQuality = index; });
                },
                child: new Column(children: [
                  new Icon(Icons.ac_unit),
                  new Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: new Text(_getDiamondQuality[index],
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
//////////////////////////////////////////////////////////////////////////////////////////////////////


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: Menu.appBarLayoutMain(context),
        ),
      key: _scaffoldKey,
      body: new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
          key: _formKey,
          autovalidate: _autovalidate,
          onWillPop: _warnUserAboutInvalidData,
          child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Text(
                      "Customize this product ",
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
                              return _karat(_getKarat.length);
                              break;
                            case 1:
                              return _diamond(_getDiamondQuality.length);
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
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    filled: true,
                    icon: const Icon(Icons.person),
                    hintText: 'What do people call you?',
                    labelText: 'Name *',
                  ),
                  onSaved: (String value) { customizedForm.name = value; },
                  validator: _validateName,
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    filled: true,
                    icon: const Icon(Icons.phone),
                    hintText: 'Where can we reach you?',
                    labelText: 'Phone Number *',
                    prefixText: '+',
                  ),
                  keyboardType: TextInputType.phone,
                  onSaved: (String value) { customizedForm.phoneNumber = value; },
                  validator: _validatePhoneNumber,
                  // TextInputFormatters are applied in sequence.
                  inputFormatters: <TextInputFormatter> [
                    WhitelistingTextInputFormatter.digitsOnly,
                    // Fit the validating format.
                  ],
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    filled: true,
                    icon: const Icon(Icons.email),
                    hintText: 'Your email address',
                    labelText: 'E-mail',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (String value) { customizedForm.email = value; },
                  validator: _validateEmail,

                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Tell us about yourself',
                    helperText: 'Keep it short, this is just a demo.',
                    labelText: 'Life story',
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Salary',
                    prefixText: '\$',
                    suffixText: 'USD',
                    suffixStyle: const TextStyle(color: Colors.green)
                  ),
                  maxLines: 1,
                ),
                
                const SizedBox(height: 24.0),
                new Center(
                  child: new RaisedButton(
                    child: const Text('SUBMIT'),
                    onPressed: _handleSubmitted,
                  ),
                ),
                const SizedBox(height: 24.0),
                new Text(
                  '* indicates required field',
                  style: Theme.of(context).textTheme.caption
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




