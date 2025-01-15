import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_flutter/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:task_flutter/bloc/dashboard_bloc/dashboard_bloc_states.dart';
import 'package:task_flutter/features/dashboard/widget/dashboard_training_listitem.dart';
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
    return BlocProvider(
      create: (BuildContext bctx ) =>DashBoardBloc(),
      child: Scaffold(
        body: BlocBuilder<DashBoardBloc,DashBoardBlocState>(
          builder: (blocContext,state) {
            return CustomScrollView(
              slivers: [
                CustomSliverAppBar(
                  expandedHeight: 250,
                  title: blocContext.watch<DashBoardBloc>().state.title,
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
            );
          }
        ),
      ),
    );
  }
}
