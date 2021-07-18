import 'dart:convert';

import 'package:films/comp/MovieListing.dart';
import 'package:films/service/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Api _api;

  List<dynamic> _movies = new List();

  String _sort = 'year';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _api = new Api();

    getAllMovies(_sort);
  }

  getAllMovies(filter) {
    _api.getAlMovies(filter).then((Response res) {
      List<dynamic> movies = json.decode(res.body)['data']['movies'];
      setState(() {
        _movies = movies;
      });
      print(movies.length);
    }).catchError((onError) {
      print("error");
    });
  }

  _updateSortFilter(v) {
    setState(() {
      _sort = v;
    });

    getAllMovies(_sort);
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sort By',
                style: TextStyle(fontSize: 18),
              ),
              //title, year, rating

              Row(
                children: [
                  Radio(
                    value: 'title',
                    onChanged: (v) {
                      _updateSortFilter(v);
                    },
                    groupValue: _sort,
                  ),
                  Text('Title'),
                  Radio(
                    value: 'year',
                    onChanged: (v) {
                      _updateSortFilter(v);
                    },
                    groupValue: _sort,
                  ),
                  Text('Year'),
                  Radio(
                    value: 'rating',
                    onChanged: (v) {
                      _updateSortFilter(v);
                    },
                    groupValue: _sort,
                  ),
                  Text('Rating'),
                ],
              )
            ],
          ),
          width: w,
          padding: EdgeInsets.only(top: 30, right: 5, left: 5),
        ),
        Container(
          height: h - 156,
          child: ListView.builder(
            itemCount: (_movies.length / 2).floor(),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  MovieListing(id:_movies[index * 2]['id'], w: w,bgimage: _movies[index * 2]['medium_cover_image'],),
                  MovieListing(id:_movies[(index * 2) + 1]['id'], w: w,bgimage: _movies[(index * 2) + 1]['medium_cover_image'],),
                  
                  
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
