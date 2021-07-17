import 'package:flutter/material.dart';

class DialogsPages extends StatefulWidget {
  DialogsPages({Key key}) : super(key: key);

  @override
  _DialogsPagesState createState() => _DialogsPagesState();
}

class _DialogsPagesState extends State<DialogsPages> {
  Future<void> _showAlertConfirm() async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must click on a button
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [Text('DO YOU REALLY WANT TO DELETE THIS Item')],
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("ok"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("cancel"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(
      builder: (c) {
        return Center(
          child: FlatButton(
            color: Colors.redAccent,
            onPressed: () {
              Scaffold.of(c).showSnackBar(SnackBar(
                content: Text("Deleted"),
                action: SnackBarAction(label: "undo", onPressed: (){},),
              ));
            },
            child: Text('Delete'),
          ),
        );
      },
    ));
  }
}
