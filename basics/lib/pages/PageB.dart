import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {

  final String title;


  PageTwo({Key key, this.title}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {

  String _title;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),

      body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Hero(
                tag: 'img',
                child: Image.asset('assets/images/bg.jpg'),
              ),
            ),

    );
  }
}