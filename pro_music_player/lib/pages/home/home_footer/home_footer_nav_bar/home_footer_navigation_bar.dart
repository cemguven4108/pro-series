import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/pages/home/home_footer/home_footer_nav_bar/home_footer_navigation_bar_item.dart';
import 'package:pro_music_player/providers/navigation_bar_provider.dart';

class HomeFooterNavigationBar extends ConsumerWidget {
  const HomeFooterNavigationBar({
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
          ...HomeFooterNavigationBarItem.values.map((item) {
            return Container(
              margin: const EdgeInsets.only(bottom: 3, top: 5),
              width: size.width * 0.25,
              child: InkWell(
                onTap: () {
                  ref.read(navigationBarNotifierProvider.notifier).changeIndex(
                        item.index,
                      );
                  handleNavigation(context, item.route);
                },
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

  void handleNavigation(
    BuildContext context,
    String route,
  ) {
    //Navigator.pushReplacementNamed(context, route);
  }
}
