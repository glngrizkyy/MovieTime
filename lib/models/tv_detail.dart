import 'package:movietime/models/company.dart';
import 'package:movietime/models/genre.dart';

class TvDetail {
  final int id;
  final bool adult;
  final int gender;
  final List<Genre> genres;
  final List<Company> companies;
  final String airDate;
  final int episodeRunTime;

  TvDetail(
    this.id,
    this.adult,
    this.gender,
    this.genres,
    this.companies,
    this.airDate,
    this.episodeRunTime,
  );

  TvDetail.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        adult = json["adult"],
        gender = json["gender"],
        genres =
            (json["genres"] as List).map((i) => new Genre.fromJson(i)).toList(),
        companies = (json["production_companies"] as List)
            .map((i) => new Company.fromJson(i))
            .toList(),
        airDate = json["release_date"],
        episodeRunTime = json["runtime"];
}
