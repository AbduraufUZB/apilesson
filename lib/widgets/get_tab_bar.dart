import 'package:flutter/material.dart';

class GetTabBar {
  static TabBar myTabBar(_tabController) {
    return TabBar(
      controller: _tabController,
      labelColor: Colors.black,
      tabs: const [
        Tab(icon: Icon(Icons.home_outlined)),
        Tab(icon: Icon(Icons.attach_money)),
      ],
    );
  }
}
