import 'package:convertorprovider/ConvertorProvideor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Constant.dart';
import 'ConvUI.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScreen();
  }
}

class MyScreen extends StatelessWidget {
  static final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ConvertorProvidor>(
      create: (context) => ConvertorProvidor(),
      child: MaterialApp(home: GridViewScreen()),
    );
  }
}

class GridViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ConvertorProvidor convProv = Provider.of<ConvertorProvidor>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          "Units Convertor",
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
        child: GridView.builder(
          itemCount: unitsName.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
              crossAxisSpacing: 50,
              childAspectRatio: 2),
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(
                // constraints: BoxConstraints(minWidth: 200, maxHeight: 100),
                padding: EdgeInsets.all(5.5),
                margin: EdgeInsets.all(15),
                child: Center(
                  child: Text(
                    unitsName[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                /* decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.pinkAccent, Colors.pink]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),*/
              ),
              onTap: () {
                Provider.of<ConvertorProvidor>(context, listen: false)
                    .setSelectedIndex(index);

                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ConvUI();
                }));
              },
            );
          },
        ),
      ),
    );
  }
}
