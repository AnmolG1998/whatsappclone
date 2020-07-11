import 'package:flutter/material.dart';
import 'package:whatsappclone/status.dart';
import 'calls.dart';
import 'camera.dart';
import 'chats.dart';
void main() =>runApp(new WhatsApp());
class WhatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "WhatsApp2.0",
      theme: new ThemeData(
        primaryColor: new Color(0xff075e54),
        accentColor: new Color(0xff25d366),
      ),
      debugShowCheckedModeBanner: false,
      home: new WhatsAppHome(),
    );
  }
}
class WhatsAppHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new WhatsAppState();
  }
}
class WhatsAppState extends State<WhatsAppHome> with SingleTickerProviderStateMixin{
  TabController t;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    t=new TabController(length: 4, vsync: this,initialIndex: 1);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("WhatsApp"),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(padding: EdgeInsets.only(right:5.0)),
          new Icon(Icons.more_vert),
        ],
        bottom: new TabBar(
          controller: t,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              new Tab(icon: Icon(Icons.camera_alt),),
              new Tab(text: "CHATS"),
              new Tab(text: "STATUS"),
              new Tab(text: "CALLS"),
            ]),
      ),
      body: new TabBarView(
        controller: t,
        children:<Widget>[
        new Camera(),
        new Chats(),
        new Status(),
        new Calls(),
      ],),
      floatingActionButton: new FloatingActionButton(
          onPressed: (){},
      backgroundColor: Theme.of(context).accentColor,
      child: new Icon(Icons.message,color: Colors.white),
      ),
    );
  }
}
