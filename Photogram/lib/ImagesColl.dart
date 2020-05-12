import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
var keyword1="Pets", keyword2="Nature";
class ImageList extends StatefulWidget {
  const ImageList({
    Key key,
  }) : super(key: key);

  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            Tab(text: 'Collection1'),
            Tab(text: 'Collection2'),
          ],
        ),
     title: Text('Photogram',),
      ),
    body: TabBarView(children:<Widget> [
       PageOne(),
       PageTwo(),
    ],),         
    );
  }
}
class PageOne extends StatelessWidget{
  List data = [];
  
  List<String> imgUrl = [];
  getdata() async{
    http.Response response =await http.get('https://api.unsplash.com/photos?query=$keyword1&page=10&per_page=100&client_id=9-d_CCfdA3bCLHS9y4VChTMedfRoXyEzvGoTe6_5f8w');
    data = json.decode(response.body);
    assign();
  }
  assign(){
    for(var i = 0; i< data.length; i++){
      imgUrl.add(data.elementAt(i)["urls"]["regular"]);
    }
  }
  Widget build(BuildContext context){
    getdata();
    return CustomScrollView(
      slivers: <Widget>[
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 220.0,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 0.7,
          ),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index){
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(image: NetworkImage(imgUrl.elementAt(index)),
            width: 200.0, height: 200.0,),
          );
        },
      childCount: data.length,
        )
        )
      ],
        
    );
     
  }
}
class PageTwo extends StatelessWidget{
  List data = [];
  List<String> imgUrl = [];
  getdata() async{
    http.Response response =await http.get('https://api.unsplash.com/photos?query=$keyword2&page=6&per_page=100&client_id=9-d_CCfdA3bCLHS9y4VChTMedfRoXyEzvGoTe6_5f8w');
    data = json.decode(response.body);
    assign();
  }
  assign(){
    for(var i = 0; i< data.length; i++){
      imgUrl.add(data.elementAt(i)["urls"]["regular"]);
    }
  }
  Widget build(BuildContext context){
    getdata();
    return CustomScrollView(
      slivers: <Widget>[
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 220.0,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 0.7,
          ),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index){
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(image: NetworkImage(imgUrl.elementAt(index)),
            width: 200.0, height: 200.0,),
          );
        },
      childCount: data.length,
        )
        )
      ],
        
    );
     
  }
}