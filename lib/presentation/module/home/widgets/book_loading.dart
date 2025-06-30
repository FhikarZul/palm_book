import 'package:flutter/material.dart';
import 'package:palm_book/presentation/module/home/widgets/book_item.dart';
import 'package:palm_book/presentation/widgets/grid_lazy_load_wrapper.dart';

class BookLoading extends StatelessWidget {
  const BookLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridLazyLoadWrapper(
        page: 1,
        itemCount: 4,
        childAspectRatio: 0.6,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return BookItem();
        },
        isLoading: false,
        onChanged: (_) {},
      ),
    );
  }
}
