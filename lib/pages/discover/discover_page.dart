import 'package:flutter/material.dart';
import 'package:the_movie/pages/pages.dart';
import 'package:the_movie/values/values.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final _searchController = TextEditingController();

  List<Tab> discoverTabs = const <Tab>[
    Tab(text: 'Movies'),
    Tab(text: 'Tv Series'),
    Tab(text: 'Documentary'),
    Tab(text: 'Sports'),
  ];

  int _currentIndex = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              Wrap(
                children: const [
                  Text('Find Movies, Tv series, and more..',
                      style: kTextSize30w400White),
                ],
              ),
              const SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Sherlock Holmes',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child:
                        Icon(Icons.search, color: AppColor.white, size: 30.0),
                  ),
                  filled: true,
                  fillColor: AppColor.searchTextField,
                ),
              ),
              const SizedBox(height: 20.0),

              DefaultTabController(
                length: discoverTabs.length,
                child: TabBar(
                  tabs: discoverTabs,
                  physics: const NeverScrollableScrollPhysics(),
                  labelColor: AppColor.iconColorStart,
                  unselectedLabelColor: AppColor.white,
                  indicatorColor: AppColor.iconColorStart,
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  labelStyle: kTextSize15w400White,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(color: AppColor.iconColorStart),
                    insets: EdgeInsets.only(right: 30.0),
                  ),
                  onTap: (int index){
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),

              ),
              Expanded(child:
                IndexedStack(
                  index: _currentIndex,
                  children: const [
                    MovieView(),
                    TVSeriesView(),
                    DocumentaryView(),
                    SportView(),

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
