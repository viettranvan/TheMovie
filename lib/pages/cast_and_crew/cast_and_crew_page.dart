import 'package:flutter/material.dart';
import 'package:the_movie/pages/cast_and_crew/cast_view.dart';
import 'package:the_movie/pages/pages.dart';
import 'package:the_movie/values/values.dart';
import 'package:the_movie/widgets/widgets.dart';

class CastAndCrewPage extends StatefulWidget {
  CastAndCrewPage({Key? key}) : super(key: key);

  @override
  State<CastAndCrewPage> createState() => _CastAndCrewPageState();
}

class _CastAndCrewPageState extends State<CastAndCrewPage> {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Cast'),
    Tab(text: 'Crew'),
  ];

  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.background,
          title: const Text('Cast & Crew', style: kTextSize28w500White),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Text('Cast And Crew in: Movie Name'),
            TabBar(
              isScrollable: true,
              physics: const NeverScrollableScrollPhysics(),
              tabs: myTabs,
              indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(color: AppColor.iconColorStart),
                  insets: EdgeInsets.only(right: 0)),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: AppColor.iconColorStart,
              unselectedLabelColor: AppColor.blur,
              labelStyle: kTextSize20w400White,
              onTap: (int index) {
                debugPrint(index.toString());
                // discoverBloc.add(OnChangeTab(index));
                setState(() {
                  tabIndex = index;
                });
              },
            ),
            Expanded(
              child: IndexedStack(
                index: tabIndex,
                children: const [CastView(), CrewView()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
