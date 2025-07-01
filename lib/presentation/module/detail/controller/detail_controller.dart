import 'package:get/get.dart';
import 'package:palm_book/domain/entities/book_entity.dart';
import 'package:palm_book/domain/entities/liked_book_entity.dart';
import 'package:palm_book/domain/usecases/delete_liked_book_usecase.dart';
import 'package:palm_book/domain/usecases/get_book_usecase.dart';
import 'package:palm_book/domain/usecases/is_liked_book_usecase.dart';
import 'package:palm_book/domain/usecases/liked_book_usecase.dart';

class DetailController extends GetxController {
  final GetBookUsecase getBookUsecase;
  final LikedBookUsecase likedBookUsecase;
  final IsLikedBookUsecase isLikedBookUsecase;
  final DeleteLikedBookUsecase deleteLikedBookUsecase;
  final id = Get.arguments;
  Rx<BookEntity> book = BookEntity.initial().obs;
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString message = "".obs;
  RxBool isLikedBook = false.obs;

  DetailController({
    required this.getBookUsecase,
    required this.likedBookUsecase,
    required this.isLikedBookUsecase,
    required this.deleteLikedBookUsecase,
  });

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() async {
    isLoading.value = true;
    isError.value = false;

    await getBook();
    checkLikedBook();

    isLoading.value = false;
  }

  Future getBook() async {
    final result = await getBookUsecase.call(id);

    result.fold(
      (error) {
        isError.value = true;
        message.value = error;
      },
      (data) async {
        book.value = data;
      },
    );
  }

  void checkLikedBook() {
    final result = isLikedBookUsecase.call(id);

    result.fold(
      (error) {
        isError.value = true;
        message.value = error;
      },
      (data) {
        isLikedBook.value = data;
      },
    );
  }

  void deleteLikedBook() {
    final result = deleteLikedBookUsecase.call(id);

    result.fold((error) {
      isError.value = true;
      message.value = error;
    }, (_) {});

    checkLikedBook();
  }

  void likedBook() {
    isError.value = false;

    final likeBook = LikedBookEntity(
      id: book.value.id,
      title: book.value.title,
      imageUrl: book.value.formats.imageJpeg ?? "",
      authors: book.value.authors.map((e) => e.name).toList(),
    );

    final result = likedBookUsecase.call(likeBook);

    result.fold((error) {
      isError.value = true;
      message.value = error;
    }, (_) {});

    checkLikedBook();
  }
}
