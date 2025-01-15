import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_flutter/bloc/dashboard_bloc/dashboard_bloc_states.dart';

class DashBoardBloc extends Cubit<DashBoardBlocState> {

  DashBoardBloc():super(DashBoardBlocState.initial()) {


  }
}
