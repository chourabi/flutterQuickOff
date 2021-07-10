import 'package:flutter/material.dart';

class TodosPage extends StatefulWidget {
  TodosPage({Key key}) : super(key: key);

  @override
  _TodosPageState createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {

  TextEditingController _todoController = new TextEditingController();


  List<String> _todos = [];






  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text("Todos app"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 156,
                child: Column(
                  children: [
                    Container(
                      child: TextField(
                        controller: _todoController,
                        keyboardType: TextInputType.text,
                        onChanged: (String v){
                          print(v);
                        },
                      ),
                      padding: EdgeInsets.all(15),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      width: w,
                      child: RaisedButton(
                        onPressed: () {


                          // get value input from the controller
                          String value = _todoController.text;


                          setState(() {
                            _todos.add(value);
                          });

                          


                        },
                        child: Text('Ajouter'),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: (h - 156 - 80),

                child: ListView.builder( itemCount: _todos.length, itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(15),
                    child: Text(_todos[index],style: TextStyle(fontSize: 19,fontWeight: FontWeight.w700),),
                  );
                }, )
              ),
            ],
          ),
        ));
  }
}
