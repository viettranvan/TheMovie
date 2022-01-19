import 'package:flutter/material.dart';
import 'package:the_movie/widgets/widgets.dart';

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
    return SizedBox(
      height: 400.0,
      child: PageView.builder(
        itemCount: 10,
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
                poster: image2,
                onGotoDetail: () => print('popular: $index'),
                movieName: 'The Lord of the Rings',
                voteAverage: '7.8',
              ),
            ),
          );
        },
      ),
    );
  }
}
