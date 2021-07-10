import 'package:basics/components/GalleryImageView.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  GalleryPage({Key key}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.extent(
          maxCrossAxisExtent: 100,
          padding: EdgeInsets.all(5),
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          children: List.generate(
              50,
              (index) => GalleryImageView(photoURL: 'https://www.pngarts.com/files/11/Avatar-PNG-Transparent-Image.png',)  )),
    );
  }
}
