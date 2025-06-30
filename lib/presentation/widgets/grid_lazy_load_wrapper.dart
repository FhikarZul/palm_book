import 'package:flutter/material.dart';
import 'package:palm_book/core/styles/colors.dart';
import 'package:palm_book/presentation/widgets/empty_data_view.dart';

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
  final double childAspectRatio;

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
    this.onScrollPosition,
    this.childAspectRatio = 1.0,
  });

  @override
  State<GridLazyLoadWrapper> createState() => _GridLazyLoadWrapperState();
}

class _GridLazyLoadWrapperState extends State<GridLazyLoadWrapper> {
  late ScrollController _scrollController;
  bool _isFetching = false;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _scrollController
        ..removeListener(_onScroll)
        ..dispose();
    } else {
      _scrollController.removeListener(_onScroll);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final padding = widget.padding ?? const EdgeInsets.all(12.0);

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 800));
        widget.onRefresh?.call();
      },
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        cacheExtent: 1000,
        slivers: [
          if (widget.itemCount == 0)
            SliverToBoxAdapter(
              child: Padding(
                padding: padding,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kNeutral10,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EmptyDataView(),
                  ),
                ),
              ),
            )
          else
            SliverPadding(
              padding: padding,
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  widget.itemBuilder,
                  childCount: widget.itemCount,
                  addRepaintBoundaries: true,
                  addAutomaticKeepAlives: true,
                ),
                gridDelegate: _buildGridDelegate(context),
              ),
            ),
          if (widget.isLoading)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  SliverGridDelegate _buildGridDelegate(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const itemWidth = 160.0;
    const spacing = 12.0;
    final crossAxisCount = screenWidth ~/ itemWidth;

    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: spacing,
      mainAxisSpacing: spacing,
      childAspectRatio: widget.childAspectRatio,
    );
  }

  int resolvePage() => widget.page == 0 ? 1 : widget.page;

  void _onScroll() {
    if (_isBottom && !_isFetching) {
      _isFetching = true;
      final page = resolvePage();
      widget.onChanged(page + 1);
      Future.delayed(const Duration(milliseconds: 500), () {
        _isFetching = false;
      });
    }

    widget.onScrollPosition?.call(_scrollController.position.pixels);
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll - 100);
  }
}
