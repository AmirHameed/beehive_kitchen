import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTrackingScreenBloc extends Cubit<int>{
  OrderTrackingScreenBloc():super(1);

  void updateTracking()=>emit(state+1);

}