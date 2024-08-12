import 'package:flutter/material.dart';

enum HomeFooterNavigationBarItem {
  home,
  explore,
  library,
  user;

  IconData get icon {
    switch (this) {
      case HomeFooterNavigationBarItem.home:
        return Icons.home_outlined;
      case HomeFooterNavigationBarItem.user:
        return Icons.account_circle_outlined;
      case HomeFooterNavigationBarItem.explore:
        return Icons.explore_outlined;
      case HomeFooterNavigationBarItem.library:
        return Icons.library_music_outlined;
    }
  }

  IconData get activeIcon {
    switch (this) {
      case HomeFooterNavigationBarItem.home:
        return Icons.home;
      case HomeFooterNavigationBarItem.user:
        return Icons.account_circle;
      case HomeFooterNavigationBarItem.explore:
        return Icons.explore;
      case HomeFooterNavigationBarItem.library:
        return Icons.library_music;
    }
  }

  String get label {
    switch (this) {
      case HomeFooterNavigationBarItem.home:
        return 'Home';
      case HomeFooterNavigationBarItem.user:
        return 'User';
      case HomeFooterNavigationBarItem.explore:
        return 'Explore';
      case HomeFooterNavigationBarItem.library:
        return 'Library';
    }
  }

  String get route {
    switch (this) {
      case HomeFooterNavigationBarItem.home:
        return '/home';
      case HomeFooterNavigationBarItem.user:
        return '/user';
      case HomeFooterNavigationBarItem.explore:
        return '/explore';
      case HomeFooterNavigationBarItem.library:
        return '/library';
    }
  }
}
