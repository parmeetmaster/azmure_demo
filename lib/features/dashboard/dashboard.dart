import 'package:flutter/material.dart';
import 'package:task_flutter/features/dashboard/widget/slider.dart';
import 'package:task_flutter/features/dashboard/widget/slider_persist_header.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            expandedHeight: 250,
            title: 'Trainings',
            imageUrl: '',
          ),
          SliderPersistHeader(),
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
