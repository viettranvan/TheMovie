import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/blocs/blocs.dart';
import 'package:the_movie/pages/pages.dart';
import 'package:the_movie/values/values.dart';
import 'package:the_movie/widgets/widgets.dart';

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
              BlocBuilder<HomeMovieBloc, HomeMovieState>(
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case HomeMovieInitial:
                      BlocProvider.of<HomeMovieBloc>(context)
                          .add(MovieStartedEvent());
                      break;
                    case MovieLoading:
                      return Container(
                        height: 230.0,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 28.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.0),
                            image: const DecorationImage(
                              image:
                                  AssetImage('assets/images/placeholder.gif'),
                              fit: BoxFit.cover
                            )),
                      );
                    case MovieLoaded:
                      return OfficialTrailerCard(
                        image: (state as MovieLoaded)
                                    .popularList
                                    .first
                                    .posterPath ==
                                null
                            ? noPosterImage
                            : baseUrlImage +
                                '${state.popularList.first.posterPath}',
                        onGotoDetail: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const MovieDetailPage()),
                        ),
                        onPlayMovie: () => print('play'),
                      );
                  }
                  return const SizedBox();
                },
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
