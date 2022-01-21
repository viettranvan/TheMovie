import 'package:flutter/material.dart';
import 'package:the_movie/values/values.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({
    Key? key,
    required this.poster,
    required this.name,
  }) : super(key: key);

  final String poster;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image: NetworkImage(poster),
              fit: BoxFit.cover,
              placeholder: placeholderImage,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          name,
          style: kTextSize12w400White,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        const SizedBox(height: 10.0),
      ],

    );
  }
}
