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
    var data;
    try {
      final response =
          await http.get(Uri.parse(AppUrls().movieName(movieName)));
      if (response.statusCode == 200) {
        await Future.delayed(const Duration(milliseconds: 100));
        data = jsonDecode(response.body.toString());
        return data;
      }
    } catch (e) {
      throw (e.toString());
    }
    return data;
  }
}
