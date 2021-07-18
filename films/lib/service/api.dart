
import 'package:http/http.dart' as http;

class Api {

  String _url = 'https://yts.mx/api/v2/list_movies.json';
  String _movieDetails = 'https://yts.mx/api/v2/movie_details.json';


  // get latest movies
  Future<http.Response> getAlMovies(String sort){
    return http.get(Uri.parse(_url+'?sort_by='+sort ));
  }

    // get one movie
  Future<http.Response> getMovieById(int id){
    return http.get(Uri.parse(_movieDetails+'?movie_id='+id.toString() ));
  }

  // get latest movies
  Future<http.Response> searchingFor(String query){
    return http.get(Uri.parse(_url+'?query_term='+query ));
  }
  
}