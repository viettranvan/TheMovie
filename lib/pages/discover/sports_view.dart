import 'package:flutter/material.dart';
import 'package:the_movie/values/values.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SportView extends StatelessWidget {
   const SportView({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: const [
  //       Expanded(
  //         child: Center(
  //           child: Text('Sport will be update soon!',style: kTextSize20w400White),
  //         ),
  //       ),
  //     ],
  //   );
  // }



  @override
  Widget build(BuildContext context) {

    List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
    RefreshController _refreshController =
    RefreshController(initialRefresh: false);

    void _onRefresh() async{
      // monitor network fetch
      await Future.delayed(Duration(milliseconds: 1000));
      // if failed,use refreshFailed()
      _refreshController.refreshCompleted();
    }

    void _onLoading() async{
      // monitor network fetch
      await Future.delayed(Duration(milliseconds: 1000));
      // if failed,use loadFailed(),if no data return,use LoadNodata()
      items.add((items.length+1).toString());

      _refreshController.loadComplete();
    }
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          itemBuilder: (c, i) => Card(child: Center(child: Text(items[i]))),
          itemExtent: 100.0,
          itemCount: items.length,
        ),
      ),
    );
  }


}
