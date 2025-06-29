import 'package:flutter/material.dart';
import 'package:palm_book/core/styles/colors.dart';
import 'package:palm_book/core/styles/typography.dart';

class GridLazyLoadWrapper extends StatefulWidget {
  final int page;
  final EdgeInsetsGeometry? padding;
  final ScrollController? controller;
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  final Function(int) onChanged;
  final bool isLoading;
  final Function()? onRefresh;
  final Function(double)? onScrollPosition;
  final String? emptyMessage;

  const GridLazyLoadWrapper({
    super.key,
    this.controller,
    required this.page,
    required this.itemCount,
    required this.itemBuilder,
    required this.isLoading,
    required this.onChanged,
    this.padding,
    this.onRefresh,
    this.emptyMessage,
    this.onScrollPosition,
  });

  @override
  State<GridLazyLoadWrapper> createState() => _GridLazyLoadWrapperState();
}

class _GridLazyLoadWrapperState extends State<GridLazyLoadWrapper> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      _scrollController = ScrollController();
    } else {
      _scrollController = widget.controller!;
    }

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _scrollController
        ..removeListener(_onScroll)
        ..dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 800));
        widget.onRefresh?.call();
      },
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          if (widget.itemCount == 0)
            SliverToBoxAdapter(
              child: Padding(
                padding: widget.padding ?? EdgeInsets.zero,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kNeutral10,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.emptyMessage ?? "No data",
                      style: kCaption1.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          else
            SliverPadding(
              padding: widget.padding ?? EdgeInsets.zero,
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  widget.itemBuilder,
                  childCount: widget.itemCount,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
              ),
            ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 4),
                SizedBox(
                  height: 30,
                  child: widget.isLoading
                      ? const Center(
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : const SizedBox(),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int resolvePage() {
    return widget.page == 0 ? 1 : widget.page;
  }

  void _onScroll() {
    if (_isBottom) {
      int page = resolvePage();
      widget.onChanged.call(page + 1);
    }

    if (widget.onScrollPosition != null) {
      widget.onScrollPosition!.call(_scrollController.position.pixels);
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    return currentScroll >= maxScroll;
  }
}
