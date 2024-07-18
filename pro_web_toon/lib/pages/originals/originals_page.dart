import 'package:flutter/material.dart';
import 'package:pro_web_toon/api/webtoon_repository.dart';
import 'package:pro_web_toon/data/webtoon_data.dart';
import 'package:pro_web_toon/pages/originals/originals_app_bar.dart';
import 'package:pro_web_toon/pages/originals/originals_body.dart';

class OriginalsPage extends StatelessWidget {
  const OriginalsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              OriginalsAppBar(),
              ElevatedButton(
                onPressed: () {
                  WebtoonRepository.instance().create(data.first);
                },
                child: Text('Create Webtoon'),
              ),
              Divider(
                color: Colors.white38,
                height: 1,
              ),
              OriginalsBody(),
            ],
          ),
        ),
      ),
    );
  }
}
