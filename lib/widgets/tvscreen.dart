import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movietime/bloc/get_tv_videos_bloc.dart';
import 'package:movietime/models/tv.dart';
import 'package:movietime/models/video.dart';
import 'package:movietime/models/video_response.dart';
import 'package:movietime/styles/Themes/fiturthemes.dart';
import 'package:movietime/styles/Themes/style.dart' as Style;
import 'package:movietime/views/videoplayer/videoplayer_fitur.dart';
import 'package:movietime/widgets/tvinfo.dart';
import 'package:sliver_fab/sliver_fab.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TVScreen extends StatefulWidget {
  final TV tv;
  TVScreen({Key key, this.tv}) : super(key: key);

  @override
  _TVScreenState createState() => _TVScreenState(tv);
}

class _TVScreenState extends State<TVScreen> {
  final TV tv;
  _TVScreenState(this.tv);

  @override
  void initState() {
    super.initState();
    tvVideosBloc..getTvVideos(tv.id);
  }

  @override
  void dispose() {
    super.dispose();
    tvVideosBloc..drainStream();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Style.Colors.mainColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.amber,
      ),
    );
    return Scaffold(
      backgroundColor: whiteColor,
      body: Builder(builder: (context) {
        return SliverFab(
          floatingPosition: FloatingPosition(right: 20),
          floatingWidget: StreamBuilder<VideoResponse>(
            stream: tvVideosBloc.subject.stream,
            builder: (context, AsyncSnapshot<VideoResponse> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.error != null &&
                    snapshot.data.error.length > 0) {
                  return _buildErrorWidget(snapshot.data.error);
                }
                return _buildVideoWidget(snapshot.data);
              } else if (snapshot.hasError) {
                return _buildErrorWidget(snapshot.error);
              } else {
                return _buildLoadingWidget();
              }
            },
          ),
          expandedHeight: 200.0,
          slivers: <Widget>[
            new SliverAppBar(
              backgroundColor: Style.Colors.mainColor,
              expandedHeight: 200.0,
              pinned: true,
              flexibleSpace: new FlexibleSpaceBar(
                  title: Text(
                    tv.name.length > 40
                        ? tv.name.substring(0, 37) + "..."
                        : tv.name,
                    style: TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.normal),
                  ),
                  background: Stack(
                    children: <Widget>[
                      Container(
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/original/" +
                                      tv.backPoster)),
                        ),
                        child: new Container(
                          decoration: new BoxDecoration(
                              color: Colors.black.withOpacity(0.5)),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [
                                0.1,
                                0.9
                              ],
                              colors: [
                                Colors.black.withOpacity(0.9),
                                Colors.black.withOpacity(0.0)
                              ]),
                        ),
                      ),
                    ],
                  )),
            ),
            SliverPadding(
                padding: EdgeInsets.all(0.0),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          tv.rating.toString(),
                          style: TextStyle(
                              color: Style.Colors.mainColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        RatingBar.builder(
                          itemSize: 10.0,
                          initialRating: tv.rating / 2,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            EvaIcons.star,
                            color: Style.Colors.secondColor,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                    child: Text(
                      "OVERVIEW",
                      style: TextStyle(
                          color: Style.Colors.mainColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      tv.overview,
                      style: TextStyle(
                          color: Style.Colors.mainColor,
                          fontSize: 12.0,
                          height: 1.5),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TvInfo(
                    id: tv.id,
                  ),
                  // Casts(
                  //   id: tv.id,
                  // ),
                  // SimilarTv(
                  //   id: tv.id,
                  // )
                ])))
          ],
        );
      }),
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

  Widget _buildVideoWidget(VideoResponse data) {
    List<Video> videos = data.videos;
    return FloatingActionButton(
      backgroundColor: Style.Colors.secondColor,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(
              controller: YoutubePlayerController(
                initialVideoId: videos[0].key,
                flags: YoutubePlayerFlags(
                  autoPlay: true,
                  mute: true,
                ),
              ),
            ),
          ),
        );
      },
      child: Icon(Icons.play_arrow),
    );
  }
}
