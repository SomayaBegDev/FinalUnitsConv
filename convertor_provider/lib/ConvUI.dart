import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Convertor.dart';
import 'ConvertorProvideor.dart';
import 'Result.dart';
import 'TextHolder.dart';

class ConvUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ConvertorProvidor convProv = Provider.of<ConvertorProvidor>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          convProv.getSelectedUnit(),
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topCenter,
              colors: [Colors.deepOrange.withOpacity(0.8), Colors.pinkAccent]),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: Convertor()),
                  Flexible(
                    child: TextHolder(),
                  ),
                  Expanded(
                    child: Convertor2(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Result(),
            )
          ],
        ),
      ),
    );
  }
}
