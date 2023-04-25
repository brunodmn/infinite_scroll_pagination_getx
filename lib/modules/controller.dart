import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeController extends GetxController {
  static const _pageSize = 60;

  final items = <String>[].obs;

  final PagingController<int, String> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() {
    "HomeController started...".printInfo();
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      "_fetchPage run...".printInfo();
      final newItems = await 1.delay().then((value) =>
          List.generate(10, (index) => 'page $pageKey - item ${index + 1}'));
      items.addAll(newItems);
      final isLastPage = items.length >= _pageSize;
      if (isLastPage) {
        "####   reached last page with ${items.length} items".printInfo();
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}
