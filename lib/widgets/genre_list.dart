import 'package:flutter/material.dart';
import 'package:movietime/bloc/get_movies_byGenre_bloc.dart';
import 'package:movietime/models/genre.dart';
import 'package:movietime/styles/Themes/fiturthemes.dart';
import 'package:movietime/styles/Themes/style.dart' as Style;
import 'package:movietime/widgets/genremovie.dart';

class GenreList extends StatefulWidget {
  final List<Genre> genres;
  GenreList({Key key, @required this.genres}) : super(key: key);

  @override
  _GenreListState createState() => _GenreListState(genres);
}

class _GenreListState extends State<GenreList>
    with SingleTickerProviderStateMixin {
  final List<Genre> genres;
  _GenreListState(this.genres);
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: genres.length);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        moviesByGenreBloc..drainStream();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 330.0,
        child: DefaultTabController(
          length: genres.length,
          child: Scaffold(
            backgroundColor: whiteColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                backgroundColor: Style.Colors.mainColor,
                bottom: TabBar(
                  controller: _tabController,
                  indicatorColor: Style.Colors.secondColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3.0,
                  unselectedLabelColor: Style.Colors.titleColor,
                  labelColor: Colors.white,
                  isScrollable: true,
                  tabs: genres.map((Genre genre) {
                    return Container(
                        padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
                        child: new Text(genre.name.toUpperCase(),
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            )));
                  }).toList(),
                ),
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: genres.map((Genre genre) {
                return GenreMovies(
                  genreId: genre.id,
                );
              }).toList(),
            ),
          ),
        ));
  }
}
