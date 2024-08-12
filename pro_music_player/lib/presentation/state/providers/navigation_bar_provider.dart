import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_bar_provider.g.dart';

@riverpod
class NavigationBarNotifier extends _$NavigationBarNotifier {
  @override
  build() {
    return 0;
  }

  void changeIndex(int index) {
    state = index;
  }
}
