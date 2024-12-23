import 'dart:convert';
import 'dart:developer';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/MovieDetailsModel.dart';
import 'package:netflix_clone/models/MovieRecommendationModel.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/models/upcoming_model.dart';
import 'package:http/http.dart' as http;

import '../models/search_movie_model.dart';

const baseUrl = "https://api.themoviedb.org/3/";
var key = "?api_key=$apikey";
late String endPoint;
class ApiServices{

  Future<UpcomingMoviesModel> getUpcomingMovies() async{
    endPoint = "movie/upcoming";
    final url = "$baseUrl$endPoint$key";
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      log("Success");
      return UpcomingMoviesModel.fromJson(jsonDecode(response.body));
    }
    else{
      print("Failed");
      log("Error: ${response.statusCode}, Body: ${response.body}");
      throw Exception("Failed to fetch movies: ${response.statusCode}");
    }
  }

  Future<UpcomingMoviesModel> getNowPlayingMovies() async{
    endPoint = "movie/now_playing";
    final url = "$baseUrl$endPoint$key";
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      log("Success");
      return UpcomingMoviesModel.fromJson(jsonDecode(response.body));
    }
    else{
      print("Failed");
      log("Error: ${response.statusCode}, Body: ${response.body}");
      throw Exception("Failed to fetch movies: ${response.statusCode}");
    }
  }

  Future<TvSeriesModel> getTopRatedSeries() async{
    endPoint = "tv/top_rated";
    final url = "$baseUrl$endPoint$key";
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      log("Success");
      return TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    else{
      print("Failed");
      log("Error: ${response.statusCode}, Body: ${response.body}");
      throw Exception("Failed to fetch movies: ${response.statusCode}");
    }
  }

  Future<SearchMoviesModel> getSearchedMovies(String searchText) async{
    endPoint = "search/movie?query=$searchText";
    final url = "$baseUrl$endPoint";
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization' : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZWUxODViOTcyZmQyYjNjODg5YmIwOTg5ZjdiMjFiMyIsIm5iZiI6MTczMTk0NjIwNy4xMzM5NDE0LCJzdWIiOiI2NzNiNjU4MWU4MzFmOGFhNDllMzUwNWEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.nfCRfyts1tRXaaAz8nJ87SzHN6CXefHj0Iz18Iy-PAk"
    });

    if(response.statusCode == 200){
      log("Success");
      return SearchMoviesModel.fromJson(jsonDecode(response.body));
    }
    else{
      print("Failed");
      log("Error: ${response.statusCode}, Body: ${response.body}");
      throw Exception("Failed to fetch searched movies: ${response.statusCode}");
    }
  }

  Future<MovieRecommendationModel> getPopularMovies() async{
    endPoint = "movie/popular";
    final url = "$baseUrl$endPoint$key";
    final response = await http.get(Uri.parse(url),);

    if(response.statusCode == 200){
      log("Success");
      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    }
    else{
      print("Failed");
      log("Error: ${response.statusCode}, Body: ${response.body}");
      throw Exception("Failed to fetch searched movies: ${response.statusCode}");
    }
  }

  Future<MovieDetailsModel> getMovieDetail(int movieId) async{
    endPoint = "movie/$movieId";
    final url = "$baseUrl$endPoint$key";
    final response = await http.get(Uri.parse(url),);

    if(response.statusCode == 200){
      log("Success");
      return MovieDetailsModel.fromJson(jsonDecode(response.body));
    }
    else{
      print("Failed");
      log("Error: ${response.statusCode}, Body: ${response.body}");
      throw Exception("Failed to fetch movie detail: ${response.statusCode}");
    }
  }

  Future<MovieRecommendationModel> getMoviesRecommendation(int movieId) async{
    endPoint = "movie/$movieId/recommendations";
    final url = "$baseUrl$endPoint$key";
    final response = await http.get(Uri.parse(url),);

    if(response.statusCode == 200){
      log("Success");
      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    }
    else{
      print("Failed");
      log("Error: ${response.statusCode}, Body: ${response.body}");
      throw Exception("Failed to fetch more movie like this: ${response.statusCode}");
    }
  }



}