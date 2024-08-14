import 'package:flutter/material.dart';

enum HomeNavigationBarItem {
  home,
  explore,
  library,
  user;

  IconData get icon {
    switch (this) {
      case HomeNavigationBarItem.home:
        return Icons.home_outlined;
      case HomeNavigationBarItem.user:
        return Icons.account_circle_outlined;
      case HomeNavigationBarItem.explore:
        return Icons.explore_outlined;
      case HomeNavigationBarItem.library:
        return Icons.library_music_outlined;
    }
  }

  IconData get activeIcon {
    switch (this) {
      case HomeNavigationBarItem.home:
        return Icons.home;
      case HomeNavigationBarItem.user:
        return Icons.account_circle;
      case HomeNavigationBarItem.explore:
        return Icons.explore;
      case HomeNavigationBarItem.library:
        return Icons.library_music;
    }
  }

  String get label {
    switch (this) {
      case HomeNavigationBarItem.home:
        return 'Home';
      case HomeNavigationBarItem.user:
        return 'User';
      case HomeNavigationBarItem.explore:
        return 'Explore';
      case HomeNavigationBarItem.library:
        return 'Library';
    }
  }

  String get route {
    switch (this) {
      case HomeNavigationBarItem.home:
        return '/home';
      case HomeNavigationBarItem.user:
        return '/user';
      case HomeNavigationBarItem.explore:
        return '/explore';
      case HomeNavigationBarItem.library:
        return '/library';
    }
  }
}
