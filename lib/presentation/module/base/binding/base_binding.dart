import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:palm_book/data/datasource/remotes/book_remote_datasource.dart';
import 'package:palm_book/data/repositories/book_repository_impl.dart';
import 'package:palm_book/domain/repositories/book_repository.dart';
import 'package:palm_book/domain/usecases/get_book_usecase.dart';
import 'package:palm_book/domain/usecases/get_books_usecase.dart';
import 'package:palm_book/presentation/module/base/controller/base_controller.dart';
import 'package:palm_book/presentation/module/home/controller/home_controller.dart';

class BaseBinding implements Bindings {
  @override
  void dependencies() {
    // http client
    Get.lazyPut(() => Dio());

    // remote source
    Get.lazyPut<BookRemoteSource>(() => BookRemoteSourceImpl(Get.find<Dio>()));

    // repository
    Get.lazyPut<BookRepository>(
      () => BookRepositoryImpl(Get.find<BookRemoteSource>()),
    );

    // usecase
    Get.lazyPut(() => GetBookUsecase(Get.find<BookRepository>()));
    Get.lazyPut(() => GetBooksUsecase(Get.find<BookRepository>()));

    // controller
    Get.lazyPut(() => BaseController());
    Get.lazyPut(() => HomeController(Get.find<GetBooksUsecase>()));
  }
}
