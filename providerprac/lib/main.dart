
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerprac/pref.dart';
import 'package:providerprac/provider/favorite_provider.dart';
import 'package:providerprac/provider/theme_changer_provider.dart';

import 'MyHomePage.dart';
import 'darktheame.dart';


void main() => runApp(new MyApp());

// This widget is the root of your application.
class MyApp extends StatefulWidget {
  // const MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(),
      child: Builder(
        builder: (BuildContext context) {
          return MultiProvider(providers: [
            ChangeNotifierProvider(create: (_)=>favoriteitemprovider()),
            ChangeNotifierProvider(create: (_)=>ThemeChanger()),
            ChangeNotifierProvider(create: (_)=>favoriteitemprovider()),
          ],
          child: Builder(builder: (BuildContext context){
            final themechanger =Provider.of<ThemeChanger>(context);
            return  MaterialApp(
              title: 'Dark Theme Demo',
              themeMode: themechanger.thememode,
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.orange,
                buttonColor:  Colors.red ,
                // textTheme: TextTheme(
                //   headline1: TextStyle(color: Colors.red , fontSize: 10)
                // )
                // appBarTheme: AppBarTheme(
                //   color: Colors.blue
                // ),
                // scaffoldBackgroundColor: Colors.red
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                buttonColor: Colors.blue ,
                // scaffoldBackgroundColor: Colors.blue ,
                // appBarTheme: AppBarTheme(
                //     color: Colors.red
                // ),
              ),
              home:LoginPage() ,
            );
          },)
          );





        },
      ),
    );
  }
}