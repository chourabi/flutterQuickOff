import 'package:films/pages/MovieDetails.dart';
import 'package:flutter/material.dart';

class MovieListing extends StatelessWidget {
  final double w;
  final String bgimage;
  final int id;
  
  const MovieListing({Key key, this.w, this.bgimage, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
          return MovieDetails(id: id,);
        },));
      },
      child: Hero(
        tag: id.toString(),
        child: Container(
        padding: EdgeInsets.all(5),
        width: w / 2,
        child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/loader.gif', image: bgimage),
      ),
      ),
    );
  }
}
