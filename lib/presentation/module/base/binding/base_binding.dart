import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:palm_book/core/utils/http_client.dart';
import 'package:palm_book/data/datasource/locals/liked_book_local_source.dart';
import 'package:palm_book/data/datasource/remotes/book_remote_source.dart';
import 'package:palm_book/data/model/dao/liked_book_dao.dart';
import 'package:palm_book/data/repositories/book_repository_impl.dart';
import 'package:palm_book/data/repositories/liked_book_repository_impl.dart';
import 'package:palm_book/domain/repositories/book_repository.dart';
import 'package:palm_book/domain/repositories/liked_book_repository.dart';
import 'package:palm_book/domain/usecases/get_book_usecase.dart';
import 'package:palm_book/domain/usecases/get_books_usecase.dart';
import 'package:palm_book/domain/usecases/get_liked_books_usecase.dart';
import 'package:palm_book/presentation/module/base/controller/base_controller.dart';
import 'package:palm_book/presentation/module/favorite/controller/favorite_controller.dart';
import 'package:palm_book/presentation/module/home/controller/home_controller.dart';

class BaseBinding implements Bindings {
  @override
  void dependencies() {
    // local source
    Get.lazyPut<LikedBookLocalSource>(
      () => LikedBookLocalSourceImpl(Get.find<Box<LikedBookDao>>()),
    );

    // remote source
    Get.lazyPut<BookRemoteSource>(
      () => BookRemoteSourceImpl(Get.find<HttpClient>()),
    );

    // repository
    Get.lazyPut<BookRepository>(
      () => BookRepositoryImpl(Get.find<BookRemoteSource>()),
    );
    Get.lazyPut<LikedBookRepository>(
      () => LikedBookRepositoryImpl(Get.find<LikedBookLocalSource>()),
    );

    // usecase
    Get.lazyPut(() => GetBookUsecase(Get.find<BookRepository>()));
    Get.lazyPut(() => GetBooksUsecase(Get.find<BookRepository>()));
    Get.lazyPut(() => GetLikedBooksUsecase(Get.find<LikedBookRepository>()));

    // controller
    Get.lazyPut(() => BaseController());
    Get.lazyPut(() => HomeController(Get.find<GetBooksUsecase>()));
    Get.lazyPut(() => FavoriteController(Get.find<GetLikedBooksUsecase>()));
  }
}
