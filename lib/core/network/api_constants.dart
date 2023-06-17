class ApiConstants {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = 'de3446f7f8e7be39b914abe7231a3839';

  static const nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const popularMoviesPath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const topRatedMoviesPath = '$baseUrl/movie/top_rated?api_key=$apiKey';
}
