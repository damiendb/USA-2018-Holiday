import 'package:flutter/material.dart';

makeTabs(List<String> tabNames) {
  final List<Tab> tabList = <Tab>[];
  int numdays = tabNames.length;

  for (var i = 0; i < numdays; i++) {
    tabList.add(Tab(      
      text: tabNames[i].toString(),
      )
    );
  }
  return tabList;
}

