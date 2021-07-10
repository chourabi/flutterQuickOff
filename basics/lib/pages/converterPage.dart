import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  ConverterPage({Key key}) : super(key: key);

  @override
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {


  String _devise = 'USD';
  TextEditingController _deviceController = new TextEditingController();
  String _res ='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Converter"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _deviceController,
                decoration: InputDecoration(
                  hintText: "Please type in the currency ( TND )",
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                ),

                
              ),
            ),
            Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      child: Row(children: [
                        Radio(
                          value: 'EUR',
                          onChanged: (v){
                            setState(() {
                              _devise = v;
                            });
                          },
                          groupValue: _devise,
                        ), Text('EUR')
                      ],),
                    ),
                    Container(
                      child: Row(children: [
                        Radio(
                          value: 'USD',
                          onChanged: (v){
                            setState(() {
                              _devise = v;
                            });
                          },
                          groupValue: _devise,
                        ), Text('USD')
                      ],),
                    ),
                    Container(
                      child: Row(children: [
                        Radio(
                          value: 'PND',
                          onChanged: (v){
                            setState(() {
                              _devise = v;
                            });
                          },
                          groupValue: _devise,
                        ), Text('PND')
                      ],),
                    ),
                    

                  ],
                )),

                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(15),
                  child: FlatButton(
                    color: Colors.pinkAccent,
                    onPressed: (){

                      // recup value input
                      String currency  = _deviceController.text;

                      switch (_devise) {
                        case 'EUR':
                            double res =  (double.parse(currency)  / 3.3);
                            setState(() {
                              _res = 'Resultat = ${res}  TND';
                            });
                          break;


                        case 'USD':
                            double res =  (double.parse(currency)  / 2.7);
                              
                             setState(() {
                                _res = 'Resultat = ${res}  TND';
                             });
                            
                          break;  
                        default:
                      }


                    },
                    child: Text('Calculer'),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(_res,style: TextStyle(fontSize: 25),),
                )
          ],
        ),
      ),
    );
  }
}
