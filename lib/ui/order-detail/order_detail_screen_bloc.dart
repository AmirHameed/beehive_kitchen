import 'package:beehive_kitchen/ui/order-detail/order_detail_screen_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailScreenBloc extends Cubit<OrderDetailScreenBlocState> {
  final  bool isStartOrder;
  final bool isStartOrderCondition;



  OrderDetailScreenBloc({this.isStartOrder = false,this.isStartOrderCondition=false})
      : super(OrderDetailScreenBlocState.initial(isStartOrder:isStartOrderCondition));


  void updateStartOrder(bool value) {
    emit(state.copyWith(isStartOrder: value));
  }
}
