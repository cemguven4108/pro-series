import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/presentation/pages/home/home_body/home_body.dart';
import 'package:pro_music_player/presentation/pages/home/home_footer/home_footer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                "Pro Player",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ];
        },
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: HomeBody(),
            ),
            HomeFooter(),
          ],
        ),
      ),
    );
  }
}
