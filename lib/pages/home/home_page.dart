import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:the_movie/pages/detail/movie_detail.dart';
import 'package:the_movie/pages/home/now_playing_view.dart';
import 'package:the_movie/pages/home/popular_view.dart';
import 'package:the_movie/pages/home/top_rated_view.dart';
import 'package:the_movie/values/values.dart';
import 'package:the_movie/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = 'Guest';

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, top: 30.0, bottom: 30.0),
                child: Text('Hello $username,', style: kTextSize30w400White),
              ),
              OfficialTrailerCard(
                image: image,
                onGotoDetail: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MovieDetailPage()),
                ),
                onPlayMovie: () => print('play'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30.0, left: 20.0, bottom: 15.0),
                child: Text(
                  'Top Rated',
                  style: kTextSize30w400White,
                ),
              ),
              const TopRatedView(),

              const Padding(
                padding: EdgeInsets.only(top: 30.0, left: 20.0, bottom: 15.0),
                child: Text(
                  'Popular',
                  style: kTextSize30w400White,
                ),
              ),
              const PopularView(),

              const Padding(
                padding: EdgeInsets.only(top: 30.0, left: 20.0, bottom: 15.0),
                child: Text(
                  'Now Playing',
                  style: kTextSize30w400White,
                ),
              ),
              const NowPlayingView(),

              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
