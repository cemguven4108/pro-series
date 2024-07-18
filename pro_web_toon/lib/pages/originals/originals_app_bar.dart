import 'package:flutter/material.dart';

class OriginalsAppBar extends StatelessWidget {
  const OriginalsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: kToolbarHeight,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildLeftSide(size.width * 0.35),
          buildRightSide(),
        ],
      ),
    );
  }

  Widget buildLeftSide(double width) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: const Text(
              "Daily",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: 1,
            height: 10,
            color: Colors.white38,
          ),
          GestureDetector(
            onTap: () {},
            child: const Text(
              "Genres",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRightSide() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.search_off,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
