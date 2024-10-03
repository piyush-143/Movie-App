class AppUrls {
  static String baseUrl = 'https://api.tvmaze.com/search/shows?q=';
  static String allMovieUrl = '${baseUrl}all';

  String movieName(String movieName) {
    return '$baseUrl$movieName';
  }



  static String errorImageUrl =
      'https://www.legrand.com.kh/modules/custom/legrand_ecat/assets/img/no-image.png';

}
