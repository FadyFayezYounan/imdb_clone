class ApiEndPoints {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String popularMovies = '/movie/popular';
  static const String topRatedMovies = '/movie/top_rated';
  static const String nowPlayingMovies = '/movie/now_playing';
  static const String upcomingMovies = '/movie/upcoming';
  static const String latestMovies = '/movie/latest';
  static String movieDetailsById({required int id}) => '/movie/$id';
  static String movieCastAndCrewById({required int id}) => '/movie/$id/credits';
  static String getMovieImagesById({required int id}) => '/movie/$id/images';
  static String getMoviesByCategoryId = '/discover/movie';
  static String searchMovies = '/search/movie';
  static String allMoviesGenres = '/genre/movie/list';
  static String getRecommendedMovies({required int id}) =>
      '/movie/$id/recommendations';
  static String getMovieKeywordsById({required int id}) =>
      '/movie/$id/keywords';
  static String getMoviesBuKeywordsId({required int id}) =>
      '/keyword/$id/movies';
  static String getMovieVideosByMovieId({required int id}) =>
      '/movie/$id/videos';
  static String similarMoviesByMovieId({required int id}) =>
      '/movie/$id/similar';
}
