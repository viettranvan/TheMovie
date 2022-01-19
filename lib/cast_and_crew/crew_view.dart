import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:the_movie/values/values.dart';
import 'package:the_movie/widgets/widgets.dart';

class CrewView extends StatelessWidget {
  const CrewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      itemCount: 10,
      crossAxisCount: 4,
      staggeredTileBuilder: (index) =>
      const StaggeredTile.count(2, 3.0),
      itemBuilder: (context,index){
        return const PersonCard(avatar: image, name: "name name");
      },

    );
  }
}
