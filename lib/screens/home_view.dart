import 'package:flutter/material.dart';
import 'package:recipy_hub/widget/category_listview.dart';
import 'package:recipy_hub/widget/category_title.dart';
import 'package:recipy_hub/widget/custom_app_bar.dart';
import 'package:recipy_hub/widget/custom_search_feild.dart';
import 'package:recipy_hub/widget/custom_text.dart';
import 'package:recipy_hub/widget/custom_sliver__graid.dart';
import 'package:recipy_hub/widget/trandding_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        animateColor : false,
        shadowColor: Colors.white,
        scrolledUnderElevation:0,
        title: CutomAppbar(
          prefixIcon: Icons.menu,
          sufixIcon: Icons.notifications_none_outlined,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(child: CustomSearchFeild()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: CategoryTitle(name1: 'Categories', name2: 'See More'),
            ),
            SliverToBoxAdapter(child: CategoriesListView()),
            SliverToBoxAdapter(
              child: CustomText(text: "Trendding Now", fontSize: 20),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 8)),

            SliverToBoxAdapter(child: TranddingCard()),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: CategoryTitle(
                  name1: 'Popular Choice',
                  name2: 'See More',
                ),
              ),
            ),
            CustomSliverGraid(),
          ],
        ),
      ),
    );
  }
}
