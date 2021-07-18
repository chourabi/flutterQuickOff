import 'dart:convert';

import 'package:films/pages/MovieDetails.dart';
import 'package:films/service/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SearchTab extends StatefulWidget {
  SearchTab({Key key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {



  Api _api;

  List<dynamic> _movies = new List();

  String query = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _api = new Api();

    getAllMovies(query);
  }

  getAllMovies(q) {
    _api.searchingFor(q).then((Response res) {
      List<dynamic> movies = json.decode(res.body)['data']['movies'];
      if(movies != null){
        setState(() {
        _movies = movies;
      });
      }
      print(movies.length);
    }).catchError((onError) {
      print("error");
    });
  }




  @override
  Widget build(BuildContext context) {
      double h = MediaQuery.of(context).size.height;


    return SingleChildScrollView(
      
      child:  Container(
      child: Column(
        children: [

          // search bloc
          Container(
            padding: EdgeInsets.only(top: 30,left: 15,right: 15),
            height: 80,
            child: TextField(
              onChanged: (String q){
                getAllMovies(q);
              },
            ),
          ),
          Container(
            height: h-80-56, 
            child: ListView.builder(itemCount: _movies.length, itemBuilder: (context, index) {
              return(
                ListTile(
                  onTap: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) {
          return MovieDetails(id: _movies[index]['id'],);
        },));
                  },
                  leading: Hero(
                    tag:  _movies[index]['id'].toString(),
                    child: Image.network(_movies[index]['medium_cover_image']),
                  ),
                  title: Text(_movies[index]['title']),
                  subtitle: Text(_movies[index]['year'].toString()),
                  
                )
              );
            },),
          )


        ],
      ),
    )
    );
  }
}