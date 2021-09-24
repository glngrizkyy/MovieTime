class SearchF {
  final int id;
  final String logo;
  final String name;
  final String country;

  SearchF(this.id, this.logo, this.name, this.country);

  SearchF.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        logo = json["logo_path"],
        name = json["name"],
        country = json["origin_country"];
}
