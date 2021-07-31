import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PublicFeeds extends StatefulWidget {
  PublicFeeds({Key key}) : super(key: key);

  @override
  _PublicFeedsState createState() => _PublicFeedsState();
}

class _PublicFeedsState extends State<PublicFeeds> {
  TextEditingController _public = new TextEditingController();
  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseMessaging _fcm = FirebaseMessaging.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  _sendMessage() {
    String msg = _public.text;
    if (msg != '') {
      // send it
      _public.text = "";
      _db
          .collection('publicfeeds')
          .add({"date": new DateTime.now(), "message": msg}).then((value) {
        print("saved !");

        _db.collection('users').get().then((res) {
          print("number of users ${res.docs.length}");
          for (var i = 0; i < res.docs.length; i++) {
            Map<String, dynamic> userData = res.docs[i].data();

      
                if (userData['token'] != null) {
                  var headers = {
              'Authorization':
                  'key=AAAAjFOdHoQ:APA91bFk4b20XrrSXdvi9fL5t9IoH6xutnczDGVKou7kPmYQFqli8hJFIrUMS9mVJUSvE1qAULu6dpFsxLUnxX8Canal8XwXRw2tLBmjt16qWNX6pDhKihCImpW_BU4AoxhNDp5h7rmM',
              'Content-Type': 'application/json'
            };

            var body = '{\r\n "to" : "' +
                userData['token'] +
                '",\r\n "collapse_key" : "type_a",\r\n "notification" : {\r\n     "body" : "new content",\r\n     "title": "new public feed"\r\n },\r\n "data" : {\r\n     "body" : "Body of Your Notification in Data",\r\n     "title": "Title of Your Notification in Title",\r\n     "key_1" : "Value for key_1",\r\n     "key_2" : "Value for key_2"\r\n }\r\n}'
                    '';
            http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
                headers: headers, body: body);
                }
          }
      });



      }).catchError(() {});

      // get all users FCMs
      
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fcm.getToken().then((token) {
      // update account !!
      _db
          .collection('users')
          .doc(_auth.currentUser.uid)
          .update({'token': token}).then((value) => null);
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    Stream<QuerySnapshot> collectionStream =
        _db.collection("publicfeeds").snapshots();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: w,
              height: 150,
              child: Row(
                children: [
                  Container(
                    width: w - 115,
                    child: TextField(
                      controller: _public,
                    ),
                  ),
                  Container(
                    width: 85,
                    child: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        _sendMessage();
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: w,
              height: h - 150,
              child: StreamBuilder(
                stream: collectionStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something wen wrong !');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return new ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> feed =
                          snapshot.data.docs[index].data();
                      return ListTile(
                        title: Text(feed['message']),
                        subtitle: Text(feed['date'].toDate().toString()),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
