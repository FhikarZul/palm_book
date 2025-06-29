import 'package:get/get.dart';
import 'package:palm_book/domain/entities/book_entity.dart';
import 'package:palm_book/domain/usecases/get_books_usecase.dart';

class HomeController extends GetxController {
  final GetBooksUsecase booksUsecase;
  RxList<BookEntity> books = <BookEntity>[].obs;
  RxInt page = 1.obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingPaginate = false.obs;
  RxBool isError = false.obs;
  RxString message = "".obs;
  RxString search = "".obs;

  HomeController(this.booksUsecase);

  @override
  void onInit() {
    getBooks(true);

    debounce(search, (value) async {
      await getBooks(true);
    }, time: const Duration(milliseconds: 500));

    super.onInit();
  }

  Future<void> getBooks(bool refresh) async {
    isError.value = false;

    if (refresh) {
      page.value = 1;
      isLoading.value = true;
      isLoadingPaginate.value = false;
    } else {
      isLoadingPaginate.value = true;
    }

    final result = await booksUsecase.call(
      page: page.value,
      search: search.value,
    );

    result.fold(
      (error) {
        isError.value = true;
        message.value = error;
      },
      (data) {
        if (refresh) {
          books.value = data;
        } else {
          books.addAll(data);
        }
      },
    );

    isLoading.value = false;
  }
}
