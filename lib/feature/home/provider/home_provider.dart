import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_state.dart';

final homeProvider =
    AutoDisposeNotifierProvider<HomeNotifier, HomeState>(HomeNotifier.new);

class HomeNotifier extends AutoDisposeNotifier<HomeState> {
  @override
  build() {
    return const HomeState();
  }

  void addItem(int index) {
    try {
      state = state.copyWith(
        selectedItems: [...state.selectedItems, index],
        status: HomeStatus.addItemSuccess,
      );
    } catch (e) {
      state = state.copyWith(
        status: HomeStatus.failure,
        errMessage: e.toString(),
      );
    }
  }

  void removeItem(int index) {
    try {
      state = state.copyWith(
        selectedItems: [...state.selectedItems]..remove(index),
        status: HomeStatus.removeItemSuccess,
      );
    } catch (e) {
      state = state.copyWith(
        status: HomeStatus.failure,
        errMessage: e.toString(),
      );
    }
  }
}
