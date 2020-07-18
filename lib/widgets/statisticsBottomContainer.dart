import 'package:flutter/material.dart';
import '../services/hexConverter.dart';

class StatisticsBottomContainer extends StatelessWidget {
  StatisticsBottomContainer(this.gullies, this.statistics, this.colors);

  final List<dynamic> gullies;
  final List<dynamic> statistics;
  final List<String> colors;

  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(),
        width: MediaQuery.of(context).size.width / 1.1,
        height: MediaQuery.of(context).size.height / 6,
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: gullies.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    // onNameChange(locations[index]);
                    //onWeightChange(weight[index]);
                  },
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 1))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 10,
                            width: 10,
                            color: HexToColor(colors[index]),
                          ),
                          Row(children: <Widget>[
                            Text('${gullies[index]['name']} ',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: HexToColor('#707070'))),
                            Text(
                              '| ${gullies[index]['parish']}',
                              style: TextStyle(
                                  fontSize: 13, color: HexToColor('#707070')),
                            )
                          ]),
                          Text("${statistics[index]['weight']} kg"),
                        ],
                      )));
            }));
  }
}
