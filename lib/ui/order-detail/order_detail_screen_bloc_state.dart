import 'package:equatable/equatable.dart';

class OrderDetailScreenBlocState extends Equatable {
  final bool isStartOrder;

  const OrderDetailScreenBlocState({required this.isStartOrder});

  const OrderDetailScreenBlocState.initial({required bool isStartOrder})
      : this(isStartOrder: isStartOrder);

  OrderDetailScreenBlocState copyWith({bool? isStartOrder}) =>
      OrderDetailScreenBlocState(
          isStartOrder: isStartOrder ?? this.isStartOrder);

  @override
  List<Object?> get props => [isStartOrder];
}
