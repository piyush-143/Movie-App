import 'package:flutter/material.dart';
import 'package:quadb_test_app/services/api_response.dart';
import 'package:quadb_test_app/services/api_services.dart';

import '../Model/movieModel.dart';

class MovieViewModel with ChangeNotifier {
  final _movieApiService = ApiServices();

  ApiResponse<List<MovieModel>> movieList = ApiResponse.loading();

  setMovieLoading(ApiResponse<List<MovieModel>> response) async {
    movieList = response;
    await Future.delayed(const Duration(milliseconds: 10), () {});
    notifyListeners();
  }

  Future<void> getMovieApi() async {
    setMovieLoading(ApiResponse.loading());

    _movieApiService.getMovieModelList().then((value) {
      setMovieLoading(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMovieLoading(ApiResponse.error(error.toString()));
    });
  }

  ApiResponse<dynamic> selectedMovieList = ApiResponse.loading();

  setSelectedMovieLoading(ApiResponse<dynamic> response) async {
    selectedMovieList = response;
    await Future.delayed(const Duration(milliseconds: 10), () {});
    notifyListeners();
  }

  Future<void> getSelectedMovieApi(String movieName) async {
    setSelectedMovieLoading(ApiResponse.loading());

    _movieApiService.getSelectedMovie(movieName).then((value) {
      setSelectedMovieLoading(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setSelectedMovieLoading(ApiResponse.error(error.toString()));
    });
  }
}
