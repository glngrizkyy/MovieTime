import 'package:flutter/material.dart';
import 'package:movietime/bloc/get_tv_detail_bloc.dart';
import 'package:movietime/models/movie_detail.dart';
import 'package:movietime/styles/Themes/style.dart' as Style;
import 'package:movietime/models/movie_detail_response.dart';

class TvInfo extends StatefulWidget {
  final int id;
  TvInfo({Key key, this.id}) : super(key: key);

  @override
  _TvInfoState createState() => _TvInfoState(id);
}

class _TvInfoState extends State<TvInfo> {
  final int id;
  _TvInfoState(this.id);
  @override
  void initState() {
    super.initState();
    tvDetailBloc..getMovieDetail(id);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieDetailResponse>(
      stream: tvDetailBloc.subject.stream,
      builder: (context, AsyncSnapshot<MovieDetailResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildMovieDetailWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget _buildMovieDetailWidget(MovieDetailResponse data) {
    MovieDetail detail = data.movieDetail;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "BUDGET",
                    style: TextStyle(
                        color: Style.Colors.mainColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    detail.budget.toString() + "\$",
                    style: TextStyle(
                        color: Style.Colors.secondColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "DURATION",
                    style: TextStyle(
                        color: Style.Colors.mainColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(detail.runtime.toString() + "min",
                      style: TextStyle(
                          color: Style.Colors.secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "RELEASE DATE",
                    style: TextStyle(
                        color: Style.Colors.mainColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(detail.releaseDate,
                      style: TextStyle(
                          color: Style.Colors.secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0))
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "GENRES",
                style: TextStyle(
                    color: Style.Colors.mainColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 38.0,
                padding: EdgeInsets.only(right: 10.0, top: 10.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: detail.genres.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            border: Border.all(
                                width: 1.0, color: Style.Colors.mainColor)),
                        child: Text(
                          detail.genres[index].name,
                          maxLines: 2,
                          style: TextStyle(
                              height: 1.4,
                              color: Style.Colors.secondColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 11),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
