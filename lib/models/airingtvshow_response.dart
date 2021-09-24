import 'airingtvshow.dart';

class AiringTVResponse {
  final List<AiringTV> tv;
  final String error;

  AiringTVResponse(this.tv, this.error);

  AiringTVResponse.fromJson(Map<String, dynamic> json)
      : tv = (json["results"] as List)
            .map((i) => new AiringTV.fromJson(i))
            .toList(),
        error = "";

  AiringTVResponse.withError(String errorValue)
      : tv = [],
        error = errorValue;
}
