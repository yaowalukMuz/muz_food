import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Widget showTitle = Text('Please Register');

  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name :', hintText: 'Name User'),
    );
  }

  Widget emailTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Email :', hintText: 'Your Email Address'),
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Password :', hintText: 'Your Passwod'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Upload to Server',
            icon: Icon(Icons.cloud_upload),
            onPressed: () {
              print('Your Click Upload');
            },
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.only(top: 60.0),
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(left: 50.0, right: 50.0),
            child: Column(
              children: <Widget>[showTitle, nameTextField(), emailTextField(),passwordTextField()],
            ),
          )),
    );
  }
}
