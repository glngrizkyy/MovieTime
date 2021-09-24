import 'package:dio/dio.dart';
import 'package:movietime/models/airingtvshow_response.dart';
import 'package:movietime/models/cast_response.dart';

import 'package:movietime/models/genre_response.dart';
import 'package:movietime/models/movieUpcoming_response.dart';
import 'package:movietime/models/movie_detail_response.dart';
import 'package:movietime/models/movie_response.dart';
import 'package:movietime/models/person_response.dart';
import 'package:movietime/models/searchfitur_response.dart';
import 'package:movietime/models/tv_response.dart';
import 'package:movietime/models/video_response.dart';

class MovieRepository {
  final String apiKey = "9175fab3d3310de562d97d407018259c";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();
  var getPopularUrl = '$mainUrl/movie/top_rated';
  var getTopRatedTVUrl = '$mainUrl/tv/top_rated';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getTvPopularUrl = '$mainUrl/tv/popular';
  var getMoviePopularUrl = '$mainUrl/movie/popular';
  var getUpcomingMovieUrl = '$mainUrl/movie/upcoming';
  var getOntheAirTVUrl = '$mainUrl/tv/on_the_air';
  var getAiringTVUrl = '$mainUrl/tv/airing_today';
  var getUpComingMoviesUrl = '$mainUrl/movie/upcoming';
  var getPersonPopularUrl = "$mainUrl/person/popular";
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGenresUrl = "$mainUrl/genre/movie/list";
  var movieUrl = "$mainUrl/movie";
  var searchTVMoviesUrl = "$mainUrl/search/company";

  Future<MovieResponse> getMovies() async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
    };
    try {
      Response response =
          await _dio.get(getPopularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<TVResponse> getTVS() async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
    };
    try {
      Response response =
          await _dio.get(getTopRatedTVUrl, queryParameters: params);
      return TVResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return TVResponse.withError("$error");
    }
  }

  Future<SearchFiturResponse> getSearchFitur() async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
    };
    try {
      Response response =
          await _dio.get(searchTVMoviesUrl, queryParameters: params);
      return SearchFiturResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return SearchFiturResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMoviesPopular() async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
    };
    try {
      Response response =
          await _dio.get(getMoviePopularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMovieUpComing() async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
    };
    try {
      Response response =
          await _dio.get(getUpcomingMovieUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<TVResponse> getTVPopular() async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
    };
    try {
      Response response =
          await _dio.get(getTvPopularUrl, queryParameters: params);
      return TVResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return TVResponse.withError("$error");
    }
  }

  Future<TVResponse> getTVOnAir() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getOntheAirTVUrl, queryParameters: params);
      return TVResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return TVResponse.withError("$error");
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieUpComingResponse> getUpComing() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getUpComingMoviesUrl, queryParameters: params);
      return MovieUpComingResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieUpComingResponse.withError("$error");
    }
  }

  Future<AiringTVResponse> getAiringToday() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getAiringTVUrl, queryParameters: params);
      return AiringTVResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return AiringTVResponse.withError("$error");
    }
  }

  Future<PersonResponse> getPersons() async {
    var params = {"api_key": apiKey};
    try {
      Response response =
          await _dio.get(getPersonPopularUrl, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return PersonResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMovieByGenre(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
      "with_genres": id
    };
    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieDetailResponse> getMovieDetail(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response =
          await _dio.get(movieUrl + "/$id", queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieDetailResponse.withError("$error");
    }
  }

  Future<VideoResponse> getMovieVideos(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/videos",
          queryParameters: params);
      return VideoResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return VideoResponse.withError("$error");
    }
  }

  Future<VideoResponse> getTvVideos(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/videos",
          queryParameters: params);
      return VideoResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return VideoResponse.withError("$error");
    }
  }

  Future<MovieResponse> getSimilarMovies(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/similar",
          queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<CastResponse> getCasts(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/credits",
          queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CastResponse.withError("$error");
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return GenreResponse.withError("$error");
    }
  }
}
