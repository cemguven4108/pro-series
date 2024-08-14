import 'package:carousel_slider/carousel_slider.dart';
import 'package:pro_music_player/presentation/state/riverpod/audio_player/audio_player_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'carousel_slider_provider.g.dart';

@riverpod
class CarouselSliderNotifier extends _$CarouselSliderNotifier {
  @override
  CarouselSliderState build() {
    _listenToIndex();

    return CarouselSliderState(
      CarouselControllerImpl(),
    );
  }

  void nextPage() async {
    await state.carouselController.nextPage();
  }

  void previousPage() async {
    await state.carouselController.previousPage();
  }

  void jumpToPage(int index) {
    state.carouselController.jumpToPage(index);
  }

  void animateToPage(int index) async {
    await state.carouselController.animateToPage(index);
  }

  void _listenToIndex() {
    ref.listen(
      audioPlayerProvider.select((value) => value.currentIndex),
      (previous, next) {
        if (previous != null && (next - previous).abs() > 1) {
          jumpToPage(next);
          return;
        }

        animateToPage(next);
      },
    );
  }
}
