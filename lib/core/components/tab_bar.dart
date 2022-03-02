import 'package:apilesson3/screens/currency_page.dart';
import 'package:apilesson3/screens/home_page.dart';
import 'package:apilesson3/service/currency_service.dart';
import 'package:apilesson3/service/news_service.dart';
import 'package:apilesson3/widgets/get_tab_bar.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: GetTabBar.myTabBar(_tabController),
        body: FutureBuilder(
          future: Future.wait(
            [NewsService.getNews(), CurrencyService.getNews(),],
          ),
          builder: (ctx,AsyncSnapshot snap) {
            if (!snap.hasData) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (snap.hasError) {
              return const Center(
                child: Text("ERROR"),
              );
            } else {
              return TabBarView(
                controller: _tabController,
                children: [
                  MyHomePage(data: snap.data[0]),
                  CurrencyPage(lst: snap.data[1])
                ],
              );
            }
          },
        ));
  }
}
