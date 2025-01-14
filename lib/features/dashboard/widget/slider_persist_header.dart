


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderPersistHeader extends StatelessWidget {
  const SliderPersistHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true,  delegate: _SliverFilterDelegate(
      minHeight: 60.0,
      maxHeight: 60.0,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton<String>(
              hint: Text("Filter 1"),
              items: ["Option 1", "Option 2", "Option 3"]
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {},
            ),
            DropdownButton<String>(
              hint: Text("Filter 2"),
              items: ["Option A", "Option B", "Option C"]
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {},
            ),
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
