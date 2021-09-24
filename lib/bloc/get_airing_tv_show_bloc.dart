import 'package:movietime/models/airingtvshow_response.dart';
import 'package:movietime/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class NowPlayingTvBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<AiringTVResponse> _subject =
      BehaviorSubject<AiringTVResponse>();

  getAiringTVShow() async {
    AiringTVResponse response = await _repository.getAiringToday();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<AiringTVResponse> get subject => _subject;
}

final nowAiringShowBloc = NowPlayingTvBloc();
