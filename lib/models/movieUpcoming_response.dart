import 'movieUpcoming.dart';

class MovieUpComingResponse {
  final List<MovieUpComing> movies;
  final String error;

  MovieUpComingResponse(this.movies, this.error);

  MovieUpComingResponse.fromJson(Map<String, dynamic> json)
      : movies = (json["results"] as List)
            .map((i) => new MovieUpComing.fromJson(i))
            .toList(),
        error = "";

  MovieUpComingResponse.withError(String errorValue)
      : movies = [],
        error = errorValue;
}
