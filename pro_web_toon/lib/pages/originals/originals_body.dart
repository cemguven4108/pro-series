import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_web_toon/pages/originals/originals_body_item.dart';
import 'package:pro_web_toon/pages/originals/originals_tab_item.dart';
import 'package:pro_web_toon/state/webtoon_bloc.dart';
import 'package:pro_web_toon/state/webtoon_event.dart';
import 'package:pro_web_toon/state/webtoon_state.dart';

class OriginalsBody extends StatefulWidget {
  const OriginalsBody({
    super.key,
  });

  @override
  State<OriginalsBody> createState() => _OriginalsBodyState();
}

class _OriginalsBodyState extends State<OriginalsBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 9,
        child: Column(
          children: <Widget>[
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.white38,
              indicatorColor: Colors.white54,
              unselectedLabelColor: Colors.white38,
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.fast,
              ),
              tabs: OriginalsTabItem.values.map((item) {
                return Tab(
                  text: item.toString(),
                );
              }).toList(),
            ),
            Flexible(
              child: TabBarView(
                children: [
                  buildContainer(0),
                  buildContainer(1),
                  buildContainer(2),
                  buildContainer(3),
                  buildContainer(4),
                  buildContainer(5),
                  buildContainer(6),
                  buildContainer(7),
                  buildContainer(8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(int day) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<WebtoonBloc, WebtoonState>(
        builder: (context, state) {
          if (state is WebtoonStateFetching || state is WebtoonStateInitial) {
            context.read<WebtoonBloc>().add(const WebtoonEventFetchAll());
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final models = (state as WebtoonStateFetched).webtoons.where(
                (model) => model.updateDay == day,
              ).toList();

          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.black,
                  toolbarHeight: 50,
                  floating: true,
                  title: Text(
                    "${models.length} items",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ];
            },
            body: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                mainAxisExtent: 200,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: models.length,
              itemBuilder: (context, index) {
                return OriginalsBodyItem(
                  model: models[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
