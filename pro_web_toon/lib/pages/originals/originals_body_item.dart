import 'package:flutter/material.dart';
import 'package:pro_web_toon/models/webtoon_model.dart';
import 'package:pro_web_toon/pages/details/details_page.dart';

class OriginalsBodyItem extends StatelessWidget {
  const OriginalsBodyItem({
    super.key,
    required this.model,
  });

  final WebtoonModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                enableDrag: true,
                builder: (context) {
                  return DetailsPage(
                    model: model,
                  );
                },
              );
            },
            child: Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1 / 1.05,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      model.cover,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.photo_size_select_actual_outlined,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // DateTime.now().difference(model.publishedAt) <
                //         const Duration(days: 30)
                //     ? Positioned(
                //         top: 5,
                //         left: 5,
                //         child: Container(
                //           padding: const EdgeInsets.all(5),
                //           decoration: BoxDecoration(
                //             color: Colors.black.withOpacity(0.5),
                //             borderRadius: BorderRadius.circular(5),
                //           ),
                //           child: const Text(
                //             "New",
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontSize: 10,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ),
                //       )
                //     : const SizedBox.shrink(),
              ],
            ),
          ),
          Text(
            model.genres.map((e) => e.toString()).join(", "),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white30,
              fontSize: 10,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            model.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
