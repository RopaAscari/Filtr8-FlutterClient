import 'dart:async';
import '../../services/api.dart';
import 'package:flutter/material.dart';
import '../../services/hexConverter.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.password, this.username});

  String password;
  String username;

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginScreen> {
  bool loading = false;
  bool attempt = false;
  bool validateUsername = false;
  bool validatePassword = false;
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    login() {
      setState(() {
        widget.password = password.text;
        widget.username = username.text;
        loading = true;
      });
      // Api().login().then((value) => print(value));
      //print(widget);

      if (widget.username == 'Ropa' && widget.password == '12345') {
        setState(() {
          loading = false;
        });
        Navigator.pushNamed(context, '/home');
      } else {
        Timer.periodic(new Duration(seconds: 1), (timer) {
          setState(() {
            loading = false;
            username.text.isEmpty
                ? validateUsername = true
                : validateUsername = false;
            password.text.isEmpty
                ? validatePassword = true
                : validatePassword = false;
            username.text != 'Ropa'
                ? validateUsername = true
                : validateUsername = false;
            password.text != '12345'
                ? validatePassword = true
                : validatePassword = false;
          });
        });
      }
    }

    double width = MediaQuery.of(context).size.width / 10;
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(width, 0, 0, 0),
                child: Container(
                    width: 400,
                    child: new Column(children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Filtr8\n\n",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w600),
                            ),
                            Image.asset("assets/blackIcon.png")
                          ]),
                      TextFormField(
                        controller: username,
                        decoration: InputDecoration(
                            errorText:
                                validateUsername ? 'Incorrect Username' : null,
                            fillColor: Colors.red,
                            labelText: 'Username',
                            icon: const Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: const Icon(Icons.person),
                            )),
                        validator: (val) =>
                            val.length < 6 ? 'Username too short.' : null,
                        onSaved: (val) => widget.username = val,
                        obscureText: false,
                      ),
                      TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                            errorText:
                                validatePassword ? 'Incorrect Password' : null,
                            labelText: 'Password',
                            icon: const Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: const Icon(Icons.lock),
                            )),
                        validator: (val) =>
                            val.length < 6 ? 'Password too short.' : null,
                        onSaved: (val) => widget.password = val,
                        obscureText: true,
                      ),
                      Text("\n\n"),
                      FloatingActionButton(
                        onPressed: () {
                          login();
                        },
                        child: Icon(Icons.arrow_forward),
                        backgroundColor: HexToColor('#306DF0'),
                      ),
                      Text("\n\n"),
                      loading
                          ? new CircularProgressIndicator(
                              backgroundColor: Colors.red,
                            )
                          : Text(''),
                    ]))),
          ]),
    );
  }
}
