import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/presentation/pages/home/widgets/home_navigation_bar/home_navigation_bar_item.dart';
import 'package:pro_music_player/presentation/state/riverpod/navigation_bar/navigation_bar_provider.dart';

class HomeNavigationBar extends ConsumerWidget {
  const HomeNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationBarNotifierProvider);
    final size = MediaQuery.of(context).size;

    return Container(
      color: const Color.fromARGB(255, 50, 50, 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ...HomeNavigationBarItem.values.map((item) {
            return Container(
              margin: const EdgeInsets.only(bottom: 3, top: 5),
              width: size.width * 0.25,
              child: InkWell(
                onTap: () => handleOnTap(
                  ref,
                  context,
                  item,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      currentIndex == item.index ? item.activeIcon : item.icon,
                      size: 23,
                      color: Colors.white,
                    ),
                    Text(
                      item.label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  void handleOnTap(
    WidgetRef ref,
    BuildContext context,
    HomeNavigationBarItem item,
  ) {
    ref.read(navigationBarNotifierProvider.notifier).changeIndex(
          item.index,
        );
    //Navigator.of(context).pushNamed(item.route);
  }
}
