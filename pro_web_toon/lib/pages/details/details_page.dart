import 'package:flutter/material.dart';
import 'package:pro_web_toon/models/webtoon_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.model,
  });

  final WebtoonModel model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_downward),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: <Widget>[
                  true
                      ? MaterialButton(
                          onPressed: () {},
                          color: Colors.white,
                          height: 25,
                          minWidth: 10,
                          shape: const CircleBorder(),
                          child: const Icon(Icons.check, size: 15),
                        )
                      // ignore: dead_code
                      : MaterialButton(
                          onPressed: () {},
                          color: Colors.white,
                          height: 25,
                          minWidth: 10,
                          shape: const StadiumBorder(),
                          child: const Text('Subscribe'),
                        ),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    height: 25,
                    minWidth: 10,
                    shape: const CircleBorder(),
                    child: const Text("i"),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    height: 25,
                    minWidth: 10,
                    shape: const CircleBorder(),
                    child: const Text(
                      "︙",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ];
          },
          body: SingleChildScrollView(
            primary: false,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    model.description,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
