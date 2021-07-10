import 'package:basics/components/ConnectedUser.dart';
import 'package:flutter/material.dart';

class ChatApp extends StatefulWidget {
  ChatApp({Key key}) : super(key: key);

  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 50,
              left: 15,
            ),
            height: 90,
            child: Text(
              'Chat',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          // section one connected users
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ConnectedUser(),
                ConnectedUser(),
                ConnectedUser(),
                ConnectedUser(),
                ConnectedUser(),
                ConnectedUser(),
                ConnectedUser(),
              ],
            ),
          ),
          // section two chat
          Container(
            height: h - (190),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('John wick'),
                  subtitle: Text('last message from this user'),
                  trailing: Text('15:60'),
                  leading: Stack(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://www.pngarts.com/files/11/Avatar-PNG-Transparent-Image.png'),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
