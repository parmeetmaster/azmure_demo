import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../domain/model/dashboard_model/dashboard_bloc_states.dart';

class DashBoardController extends GetxController {
  Rx<DashBoardModel> state = DashBoardModel.initial().obs;
  RxInt selectedFilter = 0.obs;

  CarouselSliderController clousalController=CarouselSliderController();

  @override
  void onInit() {}

  void changeActiveFilter(int index) {
    selectedFilter.value = index;
    update();
  }

  void tickSubFilter(int index) {
    state.value.filters[selectedFilter.value].subFilters[index].isActive =
        !state.value.filters[selectedFilter.value].subFilters[index].isActive;
    update();
  }
}
