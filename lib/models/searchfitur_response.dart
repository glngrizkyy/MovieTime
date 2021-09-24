import 'package:movietime/models/searchfitur.dart';

class SearchFiturResponse {
  final List<SearchF> search;
  final String error;

  SearchFiturResponse(this.search, this.error);

  SearchFiturResponse.fromJson(Map<String, dynamic> json)
      : search = (json["results"] as List)
            .map((i) => new SearchF.fromJson(i))
            .toList(),
        error = "";

  SearchFiturResponse.withError(String errorValue)
      : search = [],
        error = errorValue;
}
