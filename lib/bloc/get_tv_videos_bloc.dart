import 'package:movietime/models/video_response.dart';
import 'package:movietime/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class TvVideosBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<VideoResponse> _subject =
      BehaviorSubject<VideoResponse>();

  getTvVideos(int id) async {
    VideoResponse response = await _repository.getTvVideos(id);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<VideoResponse> get subject => _subject;
}

final tvVideosBloc = TvVideosBloc();
