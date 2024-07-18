import 'package:flutter/material.dart';
import 'package:pro_web_toon/data/webtoon_data.dart';
import 'package:pro_web_toon/pages/originals/originals_body_item.dart';
import 'package:pro_web_toon/pages/originals/originals_tab_item.dart';

class OriginalsBody extends StatefulWidget {
  const OriginalsBody({
    super.key,
  });

  @override
  State<OriginalsBody> createState() => _OriginalsBodyState();
}

class _OriginalsBodyState extends State<OriginalsBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 9, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          TabBar(
            controller: _tabController,
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
              controller: _tabController,
              children: [
                buildContainer(),
                buildContainer(),
                buildContainer(),
                buildContainer(),
                buildContainer(),
                buildContainer(),
                buildContainer(),
                buildContainer(),
                buildContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContainer() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              backgroundColor: Colors.black,
              toolbarHeight: 50,
              floating: true,
              title: Text(
                "{Number} items",
                style: TextStyle(
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
          itemCount: data.length,
          itemBuilder: (context, index) {
            return OriginalsBodyItem(
              id: data[index].id,
            );
          },
        ),
      ),
    );
  }
}
