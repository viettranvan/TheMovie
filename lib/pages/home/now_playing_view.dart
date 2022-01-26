import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/widgets/widgets.dart';

import '../../blocs/blocs.dart';
import '../../values/values.dart';
import '../pages.dart';

class NowPlayingView extends StatefulWidget {
  const NowPlayingView({Key? key}) : super(key: key);


  @override
  _NowPlayingViewState createState() => _NowPlayingViewState();
}

class _NowPlayingViewState extends State<NowPlayingView> {
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {

    void onGotoDetail(int movieId){
      Navigator.of(context)
          .pushNamed(MovieDetailPage.id, arguments: {argsKeyMovieId: movieId});
    }

    return BlocBuilder<HomeMovieBloc, HomeMovieState>(
      builder: (context,state){
        if (state is MovieLoaded) {
          return SizedBox(
            height: 400.0,
            child: PageView.builder(
              itemCount: state.nowPlayingList.length,
              controller: PageController(viewportFraction: 0.75),
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    margin: _currentIndex == index
                        ? const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 0.0)
                        : const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
                    child: HomeMovieCard(
                      poster: state.nowPlayingList[index].posterPath == null
                          ? noPosterImage
                          : baseUrlImage +
                          '${state.nowPlayingList[index].posterPath}',
                      onGotoDetail: () => onGotoDetail(state.nowPlayingList[index].id ?? 1),
                      movieName: state.nowPlayingList[index].title ?? "",
                      voteAverage:
                      state.nowPlayingList[index].voteAverage.toString(),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return SizedBox(
          height: 400.0,
          child: PageView.builder(
            itemCount: 10,
            controller: PageController(viewportFraction: 0.75),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  margin: _currentIndex == index
                      ? const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 0.0)
                      : const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    image: const DecorationImage(
                        image: placeholderImage, fit: BoxFit.cover),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
