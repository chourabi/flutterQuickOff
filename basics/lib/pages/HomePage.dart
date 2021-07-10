import 'package:basics/components/AdvancedFeedBloc.dart';
import 'package:basics/components/FeedBloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _title='My first flutter app';

  List<dynamic> _dataFromServer = [
    1,2,3,5,6,7
  ];



  @override
  Widget build(BuildContext context) {


    double w = MediaQuery.of(context).size.width;
    String _selectedValue='B';
    bool optOne = false;



    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: (){
          
        },),
          
        title: Text(_title),
        actions: [
          IconButton(icon: Icon(Icons.access_alarm), onPressed: (){},),
          IconButton(icon: Icon(Icons.access_alarm), onPressed: (){},),
          IconButton(icon: Icon(Icons.access_alarm), onPressed: (){},),
          
        ],
      ),
      drawer: Drawer(
        child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
            children: [
              ListTile(
                title: Text('Menu one'),
                subtitle: Text('Subtitle'),
                leading: Icon(Icons.ac_unit),
                trailing: Icon(Icons.access_alarm),
              )
            ],
          ),
          )

        ],),
      ),
      body: 
         Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           //mainAxisAlignment: MainAxisAlignment.center,

          children: [
            
              Container(
                padding: EdgeInsets.only(top: 50),
                child: Text('Please choose a value'),
              ),

              Row(
                
                children: [

                  Container(
                    width: ( w / 3  ),
                     
                    child: Row(children: [
                      Container(
                        child: Radio(
                          onChanged: (v){
                            print(v);

                            setState(() {
                              _selectedValue = v;
                            });
                          },
                          value: 'A',
                          groupValue: _selectedValue,
                        ),
                      ),
                      Text("A"),
                      Icon(Icons.beach_access, size: 50, color: Colors.amber,)
                    ],),
                  )
                  ,

                  Container(
                    width: ( w / 3  ),
                    child: Row(children: [
                      Container(
                        child: Radio(
                          onChanged: (v){
                            print(v);
                            
                            setState(() {
                              _selectedValue = v;
                            });
                          },
                          value: 'B',
                          groupValue: _selectedValue,
                        ),
                      ),
                      Text("B"),
                      Icon(Icons.beach_access)
                    ],),
                  )
                  ,

                  Container(
                    width: ( w / 3  ),
                    child: Row(children: [
                      Container(
                        child: Radio(
                          onChanged: (v){
                            print(v);
                            
                            setState(() {
                              _selectedValue = v;
                            });
                          },
                          value: 'C',
                          groupValue: _selectedValue,
                        ),
                      ),
                      Text("C"),
                      Icon(Icons.beach_access)
                    ],),
                  )
                  ,

 


                ],
              ),



              Text("Please choose your options"),

              Checkbox(
                onChanged: (bool v){
                  
                  setState(() {
                    optOne = v;
                  });
                },
                value: optOne,
              )

          ],
        
      ),
    );
  }
}