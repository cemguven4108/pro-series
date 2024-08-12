import 'package:carousel_slider/carousel_slider.dart';
import 'package:pro_music_player/presentation/state/providers/audio_player_provider/audio_player_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'carousel_slider_provider.g.dart';

@riverpod
class CarouselSliderNotifier extends _$CarouselSliderNotifier {
  late final CarouselController _controller;

  @override
  CarouselController build() {
    _controller = CarouselController();
    _listenToIndex();

    return state;
  }

  void nextPage() {
    _controller.nextPage();
  }

  void previousPage() {
    _controller.previousPage();
  }

  void jumpToPage(int index) {
    _controller.jumpToPage(index);
  }

  void animateToPage(int index) {
    _controller.animateToPage(index);
  }

  void _listenToIndex() {
    ref.listen(
      audioPlayerNotifierProvider.select((value) => value.currentIndex),
      (previous, next) {
        if (previous != next && next != null) {
          _controller.animateToPage(next);
        }
      },
    );
  }
}
