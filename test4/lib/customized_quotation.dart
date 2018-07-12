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

class CustomizedQuotationState extends State<CustomizedQuotation> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  CustomizedQuotationForm customizedForm = new CustomizedQuotationForm();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(value)
    ));
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




