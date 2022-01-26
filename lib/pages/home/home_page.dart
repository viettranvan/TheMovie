import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_movie/pages/pages.dart';
import 'package:the_movie/values/values.dart';
import 'package:the_movie/widgets/widgets.dart';
import 'package:the_movie/apis/apis.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    String username = _auth.currentUser?.displayName ?? 'Guest';


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
              GestureDetector(
                onTap: () async{
                  TVSeriesAPI credit = TVSeriesAPI();
                  var a = await credit.getSimilarTVShow(tvId: 125,);
                  var b = await credit.getVideoFromTV(tvId: 125,);
                  var c = await credit.getTVDetail(tvId: 123);
                  var d = await credit.getPopularTV(page: 1,);


                  print('getCastFromMovies $a\n');
                  print('getCastFromMovies $b\n');
                  print('getCastFromMovies $c\n');
                  print('getCastFromMovies $d\n');
                },
                child: Text('Click $username,', style: kTextSize20w400White),
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
