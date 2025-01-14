import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'features/dashboard/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar with Carousel Slider
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // Calculate shrink percentage
                final double shrinkOffset =
                    constraints.maxHeight - kToolbarHeight;
                final double progress = shrinkOffset / (250.0 - kToolbarHeight);
                print(progress);

                // Dynamic properties
                final Color backgroundColor =
                    Color.lerp(Colors.blue, Colors.indigo, progress)!;
                final double titleFontSize = lerpDouble(20.0, 16.0, progress)!;

                return Container(
                  color: backgroundColor,
                  child: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          'https://via.placeholder.com/800x400',
                          fit: BoxFit.cover,
                        ),
                        Text(
                          'Dynamic AppBar ${progress}',
                          style: TextStyle(
                            fontSize: titleFontSize,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          color: Colors.black.withOpacity(0.3 * progress),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Sticky Filter Section
          SliverPersistentHeader(
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
          ),

          // List of Content
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                  subtitle: Text('Subtitle $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
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
