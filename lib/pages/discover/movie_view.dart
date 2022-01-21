import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:the_movie/values/values.dart';
import 'package:the_movie/widgets/widgets.dart';

class MovieView extends StatelessWidget {
  const MovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      crossAxisCount: 4,
      itemCount: 10,
      mainAxisSpacing: 10,
      crossAxisSpacing: 22,
      itemBuilder: (BuildContext context, int index){
        return const GridViewItem(
          poster: image,
          name: 'Harry Potter',
        );
      },
      staggeredTileBuilder: (index) =>
          StaggeredTile.count(2, index % 2 == 0 ? 3.7 : 2.7),

    );
  }
}
