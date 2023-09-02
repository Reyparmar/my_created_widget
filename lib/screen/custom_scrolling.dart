import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:my_created_widget/model/custom_scroll_item_model.dart';

class CustomScrolling extends StatefulWidget {
  const CustomScrolling({super.key});

  @override
  State<CustomScrolling> createState() => _CustomScrollingState();
}

class _CustomScrollingState extends State<CustomScrolling> {
  static const _pageSize = 30;

  final PagingController<int, CustomScrollItemModel> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      debugPrint('--pageKey--------$pageKey-----');
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    debugPrint('--pageKey-fecth-------$pageKey-----');
    try {
      List<CustomScrollItemModel> newItems = [];
      await Future.delayed(const Duration(milliseconds: 40), () {
        for (int i = 1; i < 10; i++) {
          newItems.add(
            CustomScrollItemModel(
              id: ((pageKey * 10) + i),
              name: 'name ${((pageKey * 10) + i)}',
              image: 'https://placebear.com/g/200/200',
            ),
          );
        }
      });

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey.toInt());
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PagedListView<int, CustomScrollItemModel>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<CustomScrollItemModel>(
          itemBuilder: (context, item, index) => listItemView(
            item: item,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Widget listItemView({required CustomScrollItemModel item}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          tileColor: Colors.red.withOpacity(.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.all(12),
          leading: Image.network(
            item.image ?? 'N/A',
            height: 40,
            width: 40,
          ),
          title: Text(
            item.name ?? 'N/A',
          ),
        ),
      ),
    );
  }
}
