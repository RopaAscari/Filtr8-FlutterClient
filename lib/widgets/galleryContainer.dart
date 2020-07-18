import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../services//hexConverter.dart';

class GalleryContainer extends StatelessWidget {
  final String gully;
  GalleryContainer(this.gully);
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      height: MediaQuery.of(context).size.height / 2,
      child: new Stack(
        children: <Widget>[
          GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 3,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(10, (index) {
              return Center(
                child: GestureDetector(
                    onTap: () => print(index),
                    child: Image.memory(
                      base64Decode(gully),
                    )),
              );
            }),
          ),
        ],
      ),
    );
  }
}
