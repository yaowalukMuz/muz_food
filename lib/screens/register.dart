import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String nameString, emailString, passwordString;

  final formKey = GlobalKey<FormState>();

  Widget showTitle = Text('Please Register');

  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name :', hintText: 'Name User'),
      validator: (String nameValue) {
        if (nameValue.length == 0) {
          return 'please fill name';
        }
      },
      onSaved: (String nameValue) {
        nameString = nameValue;
      },
    );
  }

  Widget emailTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Email :', hintText: 'Your Email Address'),
      validator: (String emailValue) {
        if (!emailValue.contains('@')) {
          return 'please fill email format you@gmail.com';
        }
      },
      onSaved: (String emailValue) {
        emailString = emailValue;
      },
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Password :', hintText: 'Your Passwod'),
      validator: (String passValue) {
        if (passValue.length <= 5) {
          return 'please fill password more 6 charector';
        }
      },
      onSaved: (String passValue) {
        passwordString = passValue;
      },
    );
  }

  void checkValueBeforeUpload() {
    print('Your Click Upload');
    print(formKey.currentState.validate());
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      print('name = $nameString, email = $emailString, password = $passwordString');
    }
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
                checkValueBeforeUpload();
              },
            )
          ],
        ),
        body: Form(
          key: formKey,
          child: Container(
              padding: EdgeInsets.only(top: 60.0),
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0),
                child: Column(
                  children: <Widget>[
                    nameTextField(),
                    emailTextField(),
                    passwordTextField()
                  ],
                ),
              )),
        ));
  }
}
