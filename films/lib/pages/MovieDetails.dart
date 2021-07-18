import 'dart:convert';

import 'package:films/service/api.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  final int id;
  MovieDetails({Key key, this.id}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  int _id= null;
  Api _api = new Api();
  bool _isLoading = true;

  dynamic movie = null;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _id = widget.id;
    getMoviesDetails();
  }

  getMoviesDetails(){
    this._api.getMovieById(_id).then((res){
      dynamic m = json.decode(res.body)['data']['movie'];

      setState(() {
        movie = m;
        _isLoading = false;
        
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading == true ? 
      Center(
        child: CircularProgressIndicator(),
      ):
      SingleChildScrollView(
        
        child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
          Container(
            child: Hero(
              tag: _id.toString(),
              child: Image.network(movie['large_cover_image']),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(movie['title'],style: TextStyle(fontSize: 25),),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(movie['description_full'],style: TextStyle(fontSize: 18),),
          ),
          
        ],),
      )
      ),
    );
  }
}