import 'package:flutter/material.dart';
import 'ConvertorProvideor.dart';
import 'package:provider/provider.dart';

class TextHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ConvertorProvidor convProv = Provider.of<ConvertorProvidor>(context);
    TextEditingController _textFieldCont;
    return Container(
      decoration: BoxDecoration(
        /*gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.pinkAccent, Colors.pink]),*/
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.all(5.5),
      margin: EdgeInsets.fromLTRB(15, 50, 15, 50),
      child: TextField(
        onChanged: (v) => convProv.setValue(v),
        controller: _textFieldCont,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/* decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.pinkAccent, Colors.pink]),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),*/
