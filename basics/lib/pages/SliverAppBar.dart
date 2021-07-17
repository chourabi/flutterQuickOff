import 'package:flutter/material.dart';

class SliverAppBarPage extends StatefulWidget {
  SliverAppBarPage({Key key}) : super(key: key);

  @override
  _SliverAppBarPageState createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 450,
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  title: Text('This is awesome',style: TextStyle(fontSize: 16,color: Colors.white),),
                  background: Image.network("https://upload.wikimedia.org/wikipedia/en/thumb/5/51/Michael_Jackson_-_Bad.png/220px-Michael_Jackson_-_Bad.png",
                  fit: BoxFit.cover,
                  ),

                ),
              )
            ];
          },
          body: ListView(
            children: [
              ListTile(
                title: Text("Bellie jean"),
                subtitle: Text('4:05s'),
                leading: Icon(Icons.play_arrow),
              ),
              ListTile(
                title: Text("Bellie jean"),
                subtitle: Text('4:05s'),
              ),
              ListTile(
                title: Text("Bellie jean"),
                subtitle: Text('4:05s'),
              ),
              ListTile(
                title: Text("Bellie jean"),
                subtitle: Text('4:05s'),
              ),
              ListTile(
                title: Text("Bellie jean"),
                subtitle: Text('4:05s'),
              ),
              ListTile(
                title: Text("Bellie jean"),
                subtitle: Text('4:05s'),
              ),
              ListTile(
                title: Text("Bellie jean"),
                subtitle: Text('4:05s'),
              ),
              
            ],
          )
        ),
    );
  }
}