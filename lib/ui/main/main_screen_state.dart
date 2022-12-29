import 'package:equatable/equatable.dart';

class MainScreenState extends Equatable {
  final String imageUrl;
  final int index;
  final bool isLanguage;
  final List<bool> homeIndex;
  final int orderIndex;
  final bool isStore;

  const MainScreenState(
      {
      required this.index,
      required this.imageUrl,
        required this.homeIndex,
        required this.orderIndex,
        required this.isStore,
        required this.isLanguage
});

   MainScreenState.initial() : this(imageUrl: '', index: 0,isLanguage: true,homeIndex: [false,false,false,false],orderIndex: 0,isStore:true);

  MainScreenState copyWith({String? imageUrl,   int? index,bool? isLanguage,List<bool>?homeIndex,int?orderIndex,bool? isStore}) =>
      MainScreenState(
          isLanguage: isLanguage??this.isLanguage,
          index: index ?? this.index,
          isStore: isStore??this.isStore,
          orderIndex: orderIndex??this.orderIndex,
          homeIndex: homeIndex??this.homeIndex,
          imageUrl: imageUrl ?? this.imageUrl,
         );

  @override
  // TODO: implement props
  List<Object?> get props => [index, imageUrl,isLanguage,homeIndex,orderIndex,isStore];

  @override
  bool get stringify => true;
}
