import 'package:get/get.dart';
import 'package:palm_book/domain/entities/liked_book_entity.dart';
import 'package:palm_book/domain/usecases/get_liked_books_usecase.dart';

class FavoriteController extends GetxController {
  final GetLikedBooksUsecase getLikedBooksUsecase;
  RxList<LikedBookEntity> books = <LikedBookEntity>[].obs;
  RxInt page = 1.obs;
  RxBool isError = false.obs;
  RxString message = "".obs;

  FavoriteController(this.getLikedBooksUsecase);

  @override
  void onInit() {
    getBooks();
    super.onInit();
  }

  void getBooks() {
    final result = getLikedBooksUsecase.call();
    result.fold(
      (error) {
        isError.value = true;
        message.value = error;
      },
      (data) {
        books.value = data;
      },
    );
  }
}
