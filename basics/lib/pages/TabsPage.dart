
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  TabsPage({Key key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tabs"),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.directions_bus),
                ),
                Tab(
                  icon: Icon(Icons.directions_bike),
                ),
                
              ],
            ),
          ),

          body: TabBarView(
            children: [
              Center( child: Icon(Icons.home), ),
              Center( child: Icon(Icons.home), ),
              Center( child: Icon(Icons.home), ),
              
              
            ],
          ),




        ),
      ),
    );
  }
}