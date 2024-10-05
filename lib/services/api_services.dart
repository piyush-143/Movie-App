import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/services/app_Urls.dart';

import '../Model/movieModel.dart';

class ApiServices {
  List<MovieModel> movieModelList = [];
  Future<List<MovieModel>> getMovieModelList() async {
    try {
      final response = await http.get(Uri.parse(AppUrls.allMovieUrl));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (Map i in data) {
          movieModelList.add(MovieModel.fromJson(i));
        }
        return movieModelList;
      }
    } catch (e) {
      throw (e.toString());
    }
    return movieModelList;
  }

  Future<List<dynamic>> getSelectedMovie(String movieName) async {
    final response = await http.get(Uri.parse(AppUrls().movieName(movieName)));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return data;
    } else {
      throw Exception("Error!!!");
    }
  }
}
