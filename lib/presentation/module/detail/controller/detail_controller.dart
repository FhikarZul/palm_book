import 'package:get/get.dart';
import 'package:palm_book/domain/entities/book_entity.dart';
import 'package:palm_book/domain/usecases/get_book_usecase.dart';

class DetailController extends GetxController {
  final GetBookUsecase getBookUsecase;
  final id = Get.arguments;
  Rx<BookEntity> book = BookEntity.initial().obs;
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString message = "".obs;

  DetailController(this.getBookUsecase);

  @override
  void onInit() {
    getBook();
    super.onInit();
  }

  Future getBook() async {
    isLoading.value = true;
    isError.value = false;

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

    isLoading.value = false;
  }
}
