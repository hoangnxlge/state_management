import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

enum HomeStatus {
  initial,
  loading,
  addItemSuccess,
  removeItemSuccess,
  failure,
}

@freezed
class HomeState with _$HomeState {
  const HomeState._();
  const factory HomeState({
    @Default(HomeStatus.initial) final HomeStatus status,
    @Default([]) final List<int> selectedItems,
    @Default('') final String errMessage,
  }) = _HomeState;
}
