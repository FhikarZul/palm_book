import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:heroicons/heroicons.dart';
import 'package:palm_book/core/styles/colors.dart';
import 'package:palm_book/core/styles/typography.dart';
import 'package:palm_book/presentation/module/detail/controller/detail_controller.dart';
import 'package:palm_book/presentation/module/detail/widgets/detail_loading.dart';
import 'package:palm_book/presentation/module/detail/widgets/read_button.dart';
import 'package:palm_book/presentation/module/detail/widgets/section_item.dart';
import 'package:palm_book/presentation/module/detail/widgets/separator.dart';
import 'package:palm_book/presentation/widgets/cached_image.dart';
import 'package:palm_book/presentation/widgets/connection_error_view.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: kNeutral10,
        appBar: AppBar(
          backgroundColor: kNeutral10,
          elevation: 10,
          title: controller.isLoading.value
              ? SizedBox()
              : Text(controller.book.value.title),
          actions: [
            if (!(controller.isLoading.value || controller.isError.value))
              InkResponse(
                onTap: () {
                  if (controller.isLikedBook.value) {
                    controller.deleteLikedBook();
                  } else {
                    controller.likedBook();
                  }
                },
                child: HeroIcon(
                  HeroIcons.heart,
                  color: kPrimaryMain,
                  style: controller.isLikedBook.value
                      ? HeroIconStyle.solid
                      : HeroIconStyle.outline,
                ),
              ),
          ],
          actionsPadding: EdgeInsets.only(right: 14),
        ),
        body: controller.isLoading.value
            ? DetailLoading()
            : controller.isError.value
            ? ConnectionErrorView(
                message: controller.message.value,
                onPressed: () {
                  controller.getBook();
                },
              )
            : Stack(
                children: [
                  RefreshIndicator(
                    onRefresh: () async {
                      await Future.delayed(const Duration(milliseconds: 800));
                      controller.getBook();
                    },
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: kNeutral100,
                            child: Center(
                              child: CachedImage(
                                url: controller.book.value.formats.imageJpeg,
                              ),
                            ),
                          ),
                          SectionItem(
                            children: [
                              Text(
                                controller.book.value.title,
                                style: kHeadline.copyWith(color: kNeutral90),
                              ),
                              ...controller.book.value.authors.map(
                                (e) => Text(e.name, style: kCaption1),
                              ),
                            ],
                          ),
                          SectionItem(
                            withDivider: false,
                            children: [
                              Text(
                                "Summaries",
                                style: kSubHeadline.copyWith(color: kNeutral90),
                              ),
                              Separator(),
                              ...controller.book.value.summaries.map(
                                (e) => Text(e, style: kCaption1),
                              ),
                            ],
                          ),
                          SectionItem(
                            withDivider: false,
                            children: [
                              Text(
                                "Subjects",
                                style: kSubHeadline.copyWith(color: kNeutral90),
                              ),
                              Separator(),
                              ...controller.book.value.subjects.map(
                                (e) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(24),
                                        child: Container(
                                          width: 8,
                                          height: 8,
                                          color: kPrimaryMain,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Flexible(child: Text(e, style: kCaption1)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),

                  controller.isLoading.value || controller.isError.value
                      ? SizedBox()
                      : Align(
                          alignment: Alignment.bottomCenter,
                          child: ReadButton(
                            onPressed: () {
                              openInBrowser(
                                controller.book.value.formats.plainText ?? "",
                                context: context,
                              );
                            },
                          ),
                        ),
                ],
              ),
      );
    });
  }

  void openInBrowser(String url, {required BuildContext context}) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Can't open ebook"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
}
