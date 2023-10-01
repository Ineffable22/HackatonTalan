import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hackaton/providers/PushInfo.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic? data = null;
    if (context.watch<PushInfo>().data != null) {
      data = jsonDecode(context.watch<PushInfo>().data);

    }
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Home"),
        ),
        child: Center(
          child: data == null? Text("Empty"):
            DecoratedBox(
              decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.black.withOpacity(0.1),
                      spreadRadius: 10,
                      blurRadius: 5,
                      offset: Offset(0, 1),
                    )
                  ]
              ),
              child: SizedBox(
                width: 300,
                height: 300,

                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Wrap(
                    spacing: 70.0, // gap between adjacent chips
                    runSpacing: 50.0, // gap between lines
                    children: [
                      Column(
                        children: [
                          Text("Predicton:"),
                          Text(data['predicted_disaster'], style: TextStyle(fontSize: 15),),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Confidence:"),
                          Text(data['confidence'].toString(), style: TextStyle(fontSize: 15),),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Magnitude:"),
                          Text(data['magnitude'].toString(), style: TextStyle(fontSize: 15),),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Danger Level:"),
                          Text(data['danger_level'].toString(), style: TextStyle(fontSize: 15),),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Recomendation:"),
                          Text(data['recommendations'][0], style: TextStyle(fontSize: 15),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ,
        )
    );
  }
}
