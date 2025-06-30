import 'package:get/get.dart';
import 'package:palm_book/core/utils/http_client.dart';
import 'package:palm_book/data/datasource/remotes/book_remote_source.dart';
import 'package:palm_book/data/repositories/book_repository_impl.dart';
import 'package:palm_book/domain/repositories/book_repository.dart';
import 'package:palm_book/domain/usecases/get_book_usecase.dart';
import 'package:palm_book/presentation/module/detail/controller/detail_controller.dart';

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    // remote source
    Get.lazyPut<BookRemoteSource>(
      () => BookRemoteSourceImpl(Get.find<HttpClient>()),
    );

    // repository
    Get.lazyPut<BookRepository>(
      () => BookRepositoryImpl(Get.find<BookRemoteSource>()),
    );

    // usecase
    Get.lazyPut(() => GetBookUsecase(Get.find<BookRepository>()));

    // controller
    Get.lazyPut(() => DetailController(Get.find<GetBookUsecase>()));
  }
}
