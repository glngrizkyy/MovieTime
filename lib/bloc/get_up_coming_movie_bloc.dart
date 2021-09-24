import 'package:movietime/models/movieUpcoming_response.dart';
import 'package:movietime/services/repository.dart';
import 'package:rxdart/subjects.dart';

class MovieUpComingBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieUpComingResponse> _subject =
      BehaviorSubject<MovieUpComingResponse>();

  getUpComingMovie() async {
    MovieUpComingResponse response = await _repository.getUpComing();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieUpComingResponse> get subject => _subject;
}

final nowUpComingMoviesBloc = MovieUpComingBloc();
