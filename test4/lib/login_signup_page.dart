import 'dart:async';

import 'package:flutter/material.dart';
import 'test.dart';
import 'main.dart';

class LoginSignupPage extends StatefulWidget {
    const LoginSignupPage({ Key key }) : super(key: key);

  @override
  _LoginSignupPageState createState() => new _LoginSignupPageState();
}

class _CustomizePage {
  const _CustomizePage({this.pos, this.text});
  final int pos;
  final String text;
}

const List<_CustomizePage> _customizePages = const <_CustomizePage>[
  const _CustomizePage(pos: 0, text: 'SIGN IN'),
  const _CustomizePage(pos: 1, text: 'SIGN UP'),
];

class PersonLoginData {
  String email = '';
  String password = '';
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => new _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: const EdgeInsets.only(left: 15.0),
        color: Colors.white,
        child: new TextFormField(
          key: widget.fieldKey,
          obscureText: _obscureText,

          // maxLength: 8,
          onSaved: widget.onSaved,
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: new InputDecoration(
            fillColor: Colors.white,
            border: const UnderlineInputBorder(),
            filled: true,
            hintText: widget.hintText,

            labelText: widget.labelText,
            icon: new Icon(Icons.security),
            //helperText: widget.helperText,
            suffixIcon: new GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: new Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off),
            ),
          ),
        ));
  }
}

class _LoginSignupPageState extends State<LoginSignupPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller = new TabController(
        vsync: this, length: _customizePages.length, initialIndex: 0);
  }

  PersonData person = new PersonData();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  bool _autovalidate = false;
  bool _formWasEdited = false;

  final GlobalKey<FormState> _signinformKey = new GlobalKey<FormState>();
  final GlobalKey<FormState> _signupformKey = new GlobalKey<FormState>();

  final GlobalKey<FormFieldState<String>> _signinpasswordFieldKey =
      new GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _signuppasswordFieldKey =
      new GlobalKey<FormFieldState<String>>();
  void _signinhandleSubmitted() {
    final FormState form0 = _signinformKey.currentState;
    if (!form0.validate()) {
      _autovalidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form0.save();
      showInSnackBar('${person.email}');
    }
    
    Navigator.push(
      context,
    new MaterialPageRoute(
      builder: (context) => new MainBody()),
    );
                      
  }
   void _signuphandleSubmitted() {
    final FormState form1 = _signupformKey.currentState;
    if (!form1.validate()) {
      _autovalidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form1.save();
      showInSnackBar('${person.email}');
    }
  }

String _validatePassword(String value) {
    _formWasEdited = true;
    final FormFieldState<String> passwordField = _signuppasswordFieldKey.currentState;
    if (passwordField.value == null || passwordField.value.isEmpty)
      return 'Please enter a password.';
    if (passwordField.value != value)
      return 'The passwords don\'t match';
    return null;
  }

  Future<bool> _warnUserAboutInvalidData() async {
    final FormState form = _signupformKey.currentState;
    if (form == null || !_formWasEdited || form.validate()) return true;

    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: const Text('This form has errors'),
              content: const Text('Really leave this form?'),
              actions: <Widget>[
                new FlatButton(
                  child: const Text('YES'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
                new FlatButton(
                  child: const Text('NO'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ],
            );
          },
        ) ??
        false;
  }

  Widget _signin() {
    return new Form(
      key: _signinformKey,
      autovalidate: _autovalidate,
      onWillPop: _warnUserAboutInvalidData,
      child: new Container(
        margin: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: new ListView(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(left: 15.0),
              color: Colors.white,
              child: new TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: const Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  hintText: 'Your email address',
                  labelText: 'E-mail',
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (String value) {
                  person.email = value;
                },
              ),
            ),
            const SizedBox(height: 7.0),
            new PasswordField(
              fieldKey: _signinpasswordFieldKey,
              labelText: 'Password',
              hintText: "Keep a strong password",
              onFieldSubmitted: (String value) {
                setState(() {
                  person.password = value;
                });
              },
            ),
            const SizedBox(height: 7.0),
            new MaterialButton(
              height: 50.0,
              //minWidth: 70.0,
              color: Colors.white30,
              textColor: Colors.white,
              child: new Text("SIGN IN"),
              onPressed: _signinhandleSubmitted,
              splashColor: Colors.white,
            ),
            const SizedBox(height: 7.0),
            new Container(
              alignment: Alignment.centerLeft,
              child:new FlatButton(
              onPressed: (){print("forget pwd");},
              child: new Text(
                'Forget Password?',
                style: TextStyle(color: Colors.white70),
              ),
            )),
            const SizedBox(height: 14.0),
            new MaterialButton(
              height: 50.0,
              //minWidth: 70.0, 
              color: Color.fromARGB(255, 59, 89, 152),
              textColor: Colors.white,
              child: new ListTile(
                leading: new Image.asset("images/facebook-logo.png",
                    width: 24.0, height: 24.0),
                title: Text(
                  "SIGN IN WITH FACEBOOK",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
              onPressed: _signinhandleSubmitted,
              splashColor: Colors.white,
            ),
            const SizedBox(height: 7.0),
            new MaterialButton(
              height: 50.0,
              //minWidth: 70.0,
              color: Color.fromARGB(255, 220, 78, 65),
              textColor: Colors.white,
              child: new ListTile(
                leading: new Image.asset("images/google-logo.png",
                    width: 24.0, height: 24.0),
                title: Text(
                  "SIGN IN WITH GOOGLE",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
              onPressed: _signinhandleSubmitted,
              splashColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _signup() {
    return new Form(
      key: _signupformKey,
      autovalidate: _autovalidate,
      onWillPop: _warnUserAboutInvalidData,
      child: new Container (
        margin: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: new ListView(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(left: 15.0),
              color: Colors.white,
              child: new TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  hintText: 'Enter your name',
                  labelText: 'Name',
                ),
                keyboardType: TextInputType.text,
                onSaved: (String value) {
                  person.name = value;
                },
              ),
            ),
            const SizedBox(height: 7.0),
            new Container(
              padding: const EdgeInsets.only(left: 15.0),
              color: Colors.white,
              child: new TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: const Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  hintText: 'Your email address',
                  labelText: 'E-mail',
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (String value) {
                  person.email = value;
                },
              ),
            ),



const SizedBox(height: 7.0),
            new Container(
              padding: const EdgeInsets.only(left: 15.0),
              color: Colors.white,
              child: new TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: const Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  hintText: 'Your email address',
                  labelText: 'E-mail',
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (String value) {
                  person.email = value;
                },
              ),
            ),const SizedBox(height: 7.0),
            new Container(
              padding: const EdgeInsets.only(left: 15.0),
              color: Colors.white,
              child: new TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: const Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  hintText: 'Your email address',
                  labelText: 'E-mail',
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (String value) {
                  person.email = value;
                },
              ),
            ),const SizedBox(height: 7.0),
            new Container(
              padding: const EdgeInsets.only(left: 15.0),
              color: Colors.white,
              child: new TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: const Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  hintText: 'Your email address',
                  labelText: 'E-mail',
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (String value) {
                  person.email = value;
                },
              ),
            ),



            const SizedBox(height: 7.0),
            new PasswordField(
              fieldKey: _signuppasswordFieldKey,
              labelText: 'Password',
              hintText: "Keep a strong password",
              onSaved: (String value) {
                setState(() {
                  person.password = value;
                });
              },
              onFieldSubmitted: (String value) {
                setState(() {
                  person.password = value;
                });
              },
            ),
             const SizedBox(height: 7.0),
                new Container(
              padding: const EdgeInsets.only(left: 15.0),
              color: Colors.white,
              child: new TextFormField(
                  //enabled: person.password != null && person.password.isNotEmpty,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    border: const UnderlineInputBorder(),
                    filled: true,
                    labelText: 'Re-type password',  
                    icon: Icon(Icons.security)
                  ),
                  obscureText: true,
                  validator: _validatePassword,
                )),
            const SizedBox(height: 7.0),
            new MaterialButton(
              height: 50.0,
              color: Colors.white30,
              textColor: Colors.white,
              child: new Text("SIGN UP"),
              onPressed: _signuphandleSubmitted,
              splashColor: Colors.white,
            ),
            const SizedBox(height: 7.0),
            new Text(
              '* indicates required field',
              style: TextStyle(color: Colors.white70),
            ),
            
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        key: _scaffoldKey,
        body: new Container(
            color: Colors.black,
            child: Column(
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(
                      left: 15.0, right: 15.0, bottom: 15.0, top: 40.0),
                  child: Image.asset(
                    "images/logo-black.jpg",
                    alignment: Alignment.center,
                    height: (MediaQuery.of(context).size.width - 90) / 2,
                    width: MediaQuery.of(context).size.width - 90,
                    fit: BoxFit.contain,
                  ),
                ),
                new TabBar(
                    labelColor: Colors.white,
                    indicatorWeight: 4.0,
                    indicatorColor: Colors.white70,
                    controller: _controller, 
                    //          isScrollable: true,
                    labelStyle: TextStyle(fontSize: 16.0),
                    tabs: _customizePages.map((_CustomizePage _page) {
                      return new Tab(text: _page.text);
                    }).toList()),
                new SingleChildScrollView(
                    // 
                    scrollDirection: Axis.vertical,
                    controller: ScrollController(),
                    child: new Container(
                      height: MediaQuery.of(context).size.height / 1.65,
                    child: new TabBarView(
                      
                        controller: _controller,
                        children: _customizePages.map((_CustomizePage _page) {
                          //return new Tab(text: _page.text);
                          switch (_page.pos.toInt()) {
                            case 0:
                              return _signin();
                              break;
                            case 1:
                              return _signup();
                              break;
                            default:
                              new Text("data");
                          }
                        }).toList()))),
              ],
            )));
  }
}
