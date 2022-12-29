import 'package:beehive_kitchen/ui/main/main_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenBloc extends Cubit<MainScreenState> {

  MainScreenBloc() : super(MainScreenState.initial());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey globalKey = GlobalKey(debugLabel: 'btm_app_bar');

  BuildContext? textFieldContext;

  void updateIndex(index) {
    if (index != state.index) {
      emit(state.copyWith(index: index));
    }
  }

  void updateHomeIndex(index) {

    final stateList=state.homeIndex;
    final newList = List<bool>.of(stateList);

    newList[index]=!newList[index];
    emit(state.copyWith(homeIndex: newList));
  }

  void updateOrderIndex(int value){
    emit(state.copyWith(orderIndex: value));
  }

  void updateStoreStatus(bool value){
    emit(state.copyWith(isStore: value));
  }
}
