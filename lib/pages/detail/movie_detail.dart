import 'package:flutter/material.dart';
import 'package:the_movie/values/values.dart';
import 'package:the_movie/widgets/widgets.dart';
import 'package:readmore/readmore.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int minute = 152;
    List<String> genres = ['Action', 'Sci-Fi', 'Drama', 'Love'];
    String over =
        'Rey (Daisy Ridley) finally manages to find the legendary Jedi knight, Luke Skywalker (Mark Hamill) on an island with a magical aura. The heroes of The Force Awakens including Leia, Finn';

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const FadeInImage(
                    image: NetworkImage(image2),
                    placeholder: placeholderImage,
                    height: 300.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  ButtonPlay(onTap: () => print('open video')),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.75,
                            ),
                            // color: Colors.yellow,
                            child: Text('Star Wars: The Last Jedi',
                                style: kTextSize28w500White),
                          ),
                          const SizedBox(width: 10.0),
                          const DisplayResolution4K(),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.timer,
                            color: AppColor.white, size: 15.0),
                        const SizedBox(width: 8.0),
                        Text('$minute minutes', style: kTextSize15w400White),
                        const SizedBox(width: 20.0),
                        const Icon(Icons.star,
                            color: AppColor.white, size: 15.0),
                        const SizedBox(width: 8.0),
                        Text('$minute (IMDb)', style: kTextSize15w400White)
                      ],
                    ),
                    const HorizontalDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Release date',
                                  style: kTextSize20w500White),
                              const SizedBox(height: 15.0),
                              const Text('December 9, 2017',
                                  style: kTextSize15w400White),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Genre', style: kTextSize20w500White),
                              const SizedBox(height: 10.0),

                              // GenreItem(genre: 'Drama'),
                              Wrap(
                                children: genres
                                    .map(
                                      (genre) => Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10.0, top: 10.0),
                                        child: GenreItem(genre: genre),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const HorizontalDivider(),
                    const Text('Overview', style: kTextSize20w400White),
                    const SizedBox(height: 15.0),
                    ReadMoreText(
                      over,
                      trimLines: 3,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: ' show less',
                      trimMode: TrimMode.Line,
                      style: kTextSize15w400White,
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        const Text('Cast & Crew', style: kTextSize20w500White),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'More...',
                            style: kTextSize15w400White,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      height: 150.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return CastAndCrewCard(
                              avatar: image,
                              name:
                                  'Stephanie BeatrizBeatrizBeatriz  sss$index');
                        },
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Text('Related Movie', style: kTextSize20w500White),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      height: 165.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return RelatedCard(
                              poster: image,
                              name: 'Star Wars: The Rise of Skywalker (2019)');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
