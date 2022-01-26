import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/widgets/widgets.dart';

import '../../blocs/blocs.dart';
import '../../values/values.dart';

class PopularView extends StatefulWidget {
  const PopularView({Key? key}) : super(key: key);


  @override
  _PopularViewState createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  int _currentIndex = 0;
  String image2 =
      'https://image.tmdb.org/t/p/w500/qtX2Fg9MTmrbgN1UUvGoCsImTM8.jpg';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeMovieBloc, HomeMovieState>(
      builder: (context,state){
      if (state is MovieLoaded) {
        return SizedBox(
          height: 400.0,
          child: PageView.builder(
            itemCount: state.popularList.length,
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
                    poster: state.popularList[index].posterPath == null
                        ? noPosterImage
                        : baseUrlImage +
                        '${state.popularList[index].posterPath}',
                    onGotoDetail: () => print('top rated: $index'),
                    movieName: state.popularList[index].title ?? "",
                    voteAverage:
                    state.popularList[index].voteAverage.toString(),
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
                child: Image.asset('assets/images/placeholder.gif',fit: BoxFit.cover,),
              ),
            );
          },
        ),
      );
      },
    );
  }
}
