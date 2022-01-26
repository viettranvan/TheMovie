import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:the_movie/models/models.dart';
import 'package:the_movie/pages/detail/cast_detail_page.dart';
import 'package:the_movie/pages/pages.dart';

import '../../values/values.dart';
import '../../widgets/widgets.dart';

class CastAndCrewView extends StatelessWidget {
  const CastAndCrewView({Key? key, required this.casts, required this.crews})
      : super(key: key);

  final List<Cast> casts;
  final List<Crew> crews;

  @override
  Widget build(BuildContext context) {

    void  gotoCastDetail(){
      Navigator.of(context).pushNamed(CastDetailPage.id);
    }
    void  gotoCrewDetail(){
      Navigator.of(context).pushNamed(CrewDetailPage.id);
    }

    return (casts.length + crews.length) > 10
        ? SizedBox(
            height: 150.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (casts.length + crews.length) > 10
                  ? 10
                  : (casts.length + crews.length),
              itemBuilder: (context, index) {
                if (index > casts.length) {
                  return GestureDetector(
                    onTap: () => gotoCrewDetail(),
                    child: CastAndCrewCard(
                        avatar: crews[index - casts.length].profilePath == null
                            ? noProfileImage
                            : baseUrlImage +
                                '${crews[index - casts.length].profilePath}',
                        name: '${crews[index - casts.length].name}'),
                  );
                }
                return GestureDetector(
                  onTap: () => gotoCastDetail(),
                  child: CastAndCrewCard(
                      avatar: casts[index].profilePath == null
                          ? noProfileImage
                          : baseUrlImage + '${casts[index].profilePath}',
                      name: '${casts[index].name}'),
                );
              },
            ),
          )
        : const Center(
            child: Text(
              'Nothing to show!',
              style: kTextSize20w400White,
            ),
          );
  }
}