import 'package:flutter/material.dart';
import '../services/hexConverter.dart';

class ImageContainer extends StatelessWidget {
  final String _path;
  final GlobalKey<ScaffoldState> _drawerKey;

  ImageContainer(this._path, this._drawerKey);

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Project Filtr8'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Learn More about Project Filtr8...'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [HexToColor("#147EB1"), HexToColor("#0A2387")]),
          borderRadius: BorderRadius.circular(30)),
      //height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height / 2,
      child: new Column(children: <Widget>[
        new Stack(children: <Widget>[
          Image.asset(_path,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
              //height: 20,
              width: MediaQuery.of(context).size.width),
          Text("\n\n"),
          IconButton(
            iconSize: 34,
            icon: Icon(Icons.menu),
            color: Colors.white,
            onPressed: () => _drawerKey.currentState.openDrawer(),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(350, 20, 0, 0),
              child: Image.asset('assets/MainLogo.png')),
          Padding(
              padding: EdgeInsets.all(50.0),
              child: Text("\n\n\n\n\n\nHELP US KEEP",
                  style: TextStyle(color: Colors.white, fontSize: 15))),
          Padding(
              padding: EdgeInsets.all(17.0),
              child: Text("\n\n\n\n\n\n\nJAMAICA CLEAN",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600))),
        ]),
        Text(
          "Project Filtr8",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        Padding(
            padding: EdgeInsets.all(17.0),
            child: Text(
                "Our Mission is to improve Jamaica, by keeping our rivers and surrounding clean. To embrace the vision of this nation, in making out beautiful Jamaica a safe and suitable environment to live, work and raise family",
                style: TextStyle(fontSize: 15, color: Colors.white))),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: new GestureDetector(
                    onTap: () => _showMyDialog(),
                    child: Text("Learn More....",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: HexToColor('#FFC400'),
                            decoration: TextDecoration.underline))))),
      ]),
    );
  }
}
