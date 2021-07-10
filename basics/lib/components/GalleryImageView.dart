import 'package:flutter/material.dart';

class GalleryImageView extends StatefulWidget {
  final String photoURL;
  
  GalleryImageView({Key key, this.photoURL}) : super(key: key);

  @override
  _GalleryImageViewState createState() => _GalleryImageViewState();
}

class _GalleryImageViewState extends State<GalleryImageView> {

  String photoURL;
  bool _isShown = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    photoURL = widget.photoURL;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onDoubleTap: (){
        setState(() {
          _isShown = ! _isShown;
        });
      },



      child: Container(
      color: Colors.grey.shade300,
      child: _isShown == false ? Center( 
        child: Icon(Icons.image),
       ):
       
       Container(
         child: Image.network(photoURL)),
       
        
    ),
    ) ;
  }
}
