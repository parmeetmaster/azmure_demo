import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_flutter/controller/dashboard/dashboard_controller.dart';
import 'package:task_flutter/presentation/dashboard/widget/dashboard_training_listitem.dart';
import 'package:task_flutter/presentation/dashboard/widget/slider.dart';
import 'package:task_flutter/presentation/dashboard/widget/slider_persist_header.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashBoardController dashBoardController =
      Get.put(DashBoardController(),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            expandedHeight: 250,
            title: "Trainings",
            imageUrl: '',
          ),
          SliderPersistHeader(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const DashBordTrainingListItem();
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
