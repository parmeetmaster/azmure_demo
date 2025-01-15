import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_flutter/constants/colors.dart';
import 'package:task_flutter/presentation/dashboard/widget/filter_bottom_sheet.dart';

class SliderPersistHeader extends StatelessWidget {

  const SliderPersistHeader( {super.key,});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverFilterDelegate(
        minHeight: 60.0,
        maxHeight: 60.0,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
               onTap: (){
                 FilterBottomSheet.showFilterBottomSheet(context);
               },
                child: AbsorbPointer(absorbing: true,
                  child: Container(
                    padding: EdgeInsets.only(top: 3,left: 3,right: 3,bottom: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                        border: Border.all(color: ColorName.filterBlack)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.tune,
                          size: 15,
                          color: ColorName.filterBlack,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Filter"),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverFilterDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverFilterDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant _SliverFilterDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}
