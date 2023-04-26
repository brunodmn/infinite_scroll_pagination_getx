import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
            appBar: AppBar(title: const Text('HomePage')),
            body: SafeArea(
                child: PagedListView<int, String>(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<String>(
                itemBuilder: (context, item, index) => Card(
                  child: Text(
                    item,
                    style: context.textTheme.titleLarge,
                  ),
                ),
              ),
            )));

  }
}
