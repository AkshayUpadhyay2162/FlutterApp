import 'package:flutter/material.dart';
import 'ImagesColl.dart';
void main(){
 
   runApp(App());
 }

 class App extends StatelessWidget{
    Widget build(BuildContext context){
      return MaterialApp(
        home: DefaultTabController(
          length: 2,
          child: ImageList(),),
      );
    }
 }

