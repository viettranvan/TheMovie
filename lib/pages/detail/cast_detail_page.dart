import 'package:flutter/material.dart';
import 'package:the_movie/values/values.dart';
import 'package:the_movie/widgets/widgets.dart';

class CastDetailPage extends StatelessWidget {
  const CastDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const GoBackButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: const SizedBox(
                  height: 600.0,
                  width: double.infinity,
                  child: FadeInImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                    placeholder: placeholderImage,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text('Gemma Chan', style: kTextSize30w400White),
                    ),
                    const SizedBox(height: 10.0),
                    const Text('Original name: Gemma Chan', style: kTextSize15w400White),
                    const SizedBox(height: 8.0),

                    Row(
                      children: [
                        Text('Gender: ${getGender(1)}',style: kTextSize15w400White),
                        const SizedBox(height: 5.0),
                        Icon(getIconDataGender(1),color: AppColor.white),
                        const SizedBox(width: 25.0),

                        Text('Popularity: 88.125',style: kTextSize15w400White),
                        const SizedBox(width: 5.0),
                        const Icon(Icons.star,color: AppColor.white),
                      ],
                    ),
                    const HorizontalDivider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Role', style: kTextSize25w400White),
                              const SizedBox(height: 10.0),
                              const Text('Cast', style: kTextSize18w400White),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Known for', style: kTextSize25w400White),
                              const SizedBox(height: 10.0),
                              const Text('Acting', style: kTextSize18w400White),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const HorizontalDivider(),
                    const Text('Character: Halley quin', style: kTextSize25w400White),

                    const SizedBox(height: 20.0),
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
