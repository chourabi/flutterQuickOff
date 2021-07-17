import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final picker = ImagePicker();
  File _image = null;
  ImageSource _source = ImageSource.gallery;

  Future _choosePicture() async {
    final pickedFile = await picker.getImage(source: _source);

    if (pickedFile != null) {
      // we have an image
      setState(() {

        _image = File(pickedFile.path);

      });
    }
  }





  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 80),
        width: w,
        child: Column(
          children: [
            GestureDetector(
              onTap: (){

                showModalBottomSheet(context: context, builder: (ctx) {
                  return Container(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                       Container(
                         padding: EdgeInsets.all(15),
                         child: Text('Please choose an image source',style: TextStyle(fontSize: 18),),
                       ),
                       ListTile(
                         leading: Icon(Icons.camera),
                         title: Text('Camera'),
                         onTap: (){
                             _source = ImageSource.camera;
                            Navigator.pop(ctx);
                            _choosePicture();
                         },
                       ),
                       ListTile(
                         leading: Icon(Icons.wallpaper),
                         title: Text('Gallery'),
                         onTap: (){
                           _source = ImageSource.gallery;
                           Navigator.pop(ctx);
                           _choosePicture();
                         },
                       )
                     ],),
                  );
                },);


              },
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.grey,

                backgroundImage: _image == null ? NetworkImage('https://tse4.mm.bing.net/th/id/OIP.5n41jHLjCl7Fk1NBVLkepgHaHa?pid=ImgDet&rs=1') 
                : FileImage(_image),
              ),
            )
          ],
        ),
      ),
    );
  }
}
