class TV {
  final int id;
  final double popularity;
  final String name;
  final String backPoster;
  final String poster;
  final String overview;
  final double rating;

  TV(this.id, this.popularity,  this.backPoster, this.poster,
      this.overview, this.rating, this.name);

  TV.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"],
        name = json["name"] ?? "",
        backPoster = json["backdrop_path"],
        poster = json["poster_path"],
        overview = json["overview"],
        rating = json["vote_average"].toDouble();
}
