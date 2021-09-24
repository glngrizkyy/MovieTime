import 'package:movietime/models/tv_response.dart';
import 'package:movietime/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class TVListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<TVResponse> _subject = BehaviorSubject<TVResponse>();

  getTV() async {
    TVResponse response = await _repository.getTVPopular();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<TVResponse> get subject => _subject;
}

final tvBloc = TVListBloc();
