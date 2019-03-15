import 'package:flutter/material.dart';
import 'screens/register.dart';
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
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Password', hintText: 'more 6 charater'),
    );
  }

  Widget signInButton() {
    return RaisedButton(
      color: Colors.orange[700],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('You Click SignIn');
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
        var registerRoute =
            new MaterialPageRoute(builder: (BuildContext context)=>Register());
        Navigator.of(context).push(registerRoute);
      },
       // ------ Routing -----------
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  children: <Widget>[signInButton(), signUpButton(context)],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
