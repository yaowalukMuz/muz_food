import 'package:flutter/material.dart';
import 'screens/register.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

// void main() {
//   runApp(App());
// }

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muz Food',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Exlicit
  final formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String emailString, passwordString;

  void showSnackBar(String message) {
    final snackBar = new SnackBar(
      content: Text(
        message,
        style: TextStyle(fontSize: 20.0),
      ),
      backgroundColor: Colors.red,
      duration: new Duration(seconds: 3),
      action: new SnackBarAction(
        label: 'Hint',
        onPressed: () {},
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Widget nameApp = Text(
    'Muz Food',
    style: TextStyle(
        fontFamily: 'ShadowsIntoLight',
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: Colors.red[400]),
  );
  Widget logo = Image.asset('images/coffee.png');
  // Widget logo =FlutterLogo();

  //
  Widget emailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email Address', hintText: 'your@email.com'),
      validator: (String emailValue) {
        if (!emailValue.contains('@')) {
          return 'please fill email format';
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
          InputDecoration(labelText: 'Password', hintText: 'more 6 charater'),
      validator: (String passwordValue) {
        if (passwordValue.length <= 5) {
          return 'please fill password more 6 charator';
        }
      },
      onSaved: (String passwordValue) {
        passwordString = passwordValue;
      },
    );
  }

  void checkUserAndPass(
      BuildContext context, String email, String password) async {
    print('check:: email = $email,password = $password ');
    String urlString =
        'http://androidthai.in.th/chit/getUserWhereUserMuz.php?isAdd=true&Email=$email';
    var response = await get(urlString);
    var result = json.decode(response.body);
    print('result = $result');
    if (result.toString() == 'null') {
      showSnackBar('User False');
      // showAlertDialog(context);
    } else {}
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text('OK'),
      onPressed: () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );

    AlertDialog alertDialog = AlertDialog(
      title: Text('Have Problem!'),
      content: Text('User false'),
      actions: <Widget>[okButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  Widget signInButton(BuildContext context) {
    return RaisedButton(
      color: Colors.orange[700],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('You Click SignIn');
        print(formKey.currentState.validate());

        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          checkUserAndPass(context, emailString, passwordString);
        }
      },
    );
  }

  Widget signUpButton(BuildContext context) {
    return RaisedButton(
      color: Colors.orange[100],
      child: Text(
        'Sign Up',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        //log cat
        print('You Click signUp');
        // ------ Routing -----------
        var registerRoute = new MaterialPageRoute(
            builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);
      },
      // ------ Routing -----------
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Form(
          key: formKey,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green[900], Colors.lightGreen],
                    begin: Alignment.topCenter)),
            child: Container(
              padding: EdgeInsets.all(30.0),
              margin: EdgeInsets.only(top: 80.0),
              constraints: BoxConstraints.expand(width: 300.0),
              child: Column(
                children: <Widget>[
                  logo,
                  nameApp,
                  emailTextField(),
                  passwordTextField(),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        signInButton(context),
                        signUpButton(context)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
