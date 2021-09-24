part of 'homescreen_fitur.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        children: <Widget>[
          GenreScreen(),
          PlayingNow(),
          PopularMovies(),
          UpComingMovie(),
          PersonsList(),
          BestMovies(),
          TVOnAir(),
          TVPopular(),
          AiringToday(),
          BestTVShow(),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
