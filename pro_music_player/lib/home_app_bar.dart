import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          const SliverAppBar(
            backgroundColor: Colors.deepPurple,
            centerTitle: true,
            pinned: true,
            title: Text(
              "Pro Music",
              style: TextStyle(
                color: Colors.red,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SliverAppBar(
            backgroundColor: Colors.deepPurple,
            flexibleSpace: Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  buildContainer(
                    Icons.star_outlined,
                    "Favorites",
                    size.width * 0.3,
                  ),
                  buildContainer(
                    Icons.my_library_music_outlined,
                    "Playlists",
                    size.width * 0.3,
                  ),
                  buildContainer(
                    Icons.access_time_filled_outlined,
                    "Recent",
                    size.width * 0.3,
                  ),
                ],
              ),
            ),
          ),
        ];
      },
      body: body,
    );
  }

  Widget buildContainer(IconData icon, String text, width) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green.shade900,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
