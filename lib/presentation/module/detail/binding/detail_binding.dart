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
import 'package:palm_book/domain/usecases/delete_liked_book_usecase.dart';
import 'package:palm_book/domain/usecases/get_book_usecase.dart';
import 'package:palm_book/domain/usecases/is_liked_book_usecase.dart';
import 'package:palm_book/domain/usecases/liked_book_usecase.dart';
import 'package:palm_book/presentation/module/detail/controller/detail_controller.dart';

class DetailBinding implements Bindings {
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
    Get.lazyPut(() => LikedBookUsecase(Get.find<LikedBookRepository>()));
    Get.lazyPut(() => IsLikedBookUsecase(Get.find<LikedBookRepository>()));
    Get.lazyPut(() => DeleteLikedBookUsecase(Get.find<LikedBookRepository>()));

    // controller
    Get.lazyPut(
      () => DetailController(
        getBookUsecase: Get.find<GetBookUsecase>(),
        likedBookUsecase: Get.find<LikedBookUsecase>(),
        isLikedBookUsecase: Get.find<IsLikedBookUsecase>(),
        deleteLikedBookUsecase: Get.find<DeleteLikedBookUsecase>(),
      ),
    );
  }
}
