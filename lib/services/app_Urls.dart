class AppUrls {
  static String baseUrl = 'https://api.tvmaze.com/search/shows?q=';
  static String allMovieUrl = '${baseUrl}all';

  String movieName(String movieName) {
    return '$baseUrl$movieName';
  }

  static String errorImageUrl =
      'https://static.vecteezy.com/system/resources/thumbnails/022/059/000/small/no-image-available-icon-vector.jpg';
}
