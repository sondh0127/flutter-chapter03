import 'package:chapter03/api/mock_fooderlich_service.dart';
import 'package:chapter03/components/friend_post_list_view.dart';
import 'package:chapter03/components/today_recipe_list_view.dart';
import 'package:chapter03/models/models.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);

  final mockService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      // initialData: {},
      builder: (BuildContext context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final recipes = snapshot.data?.todayRecipes ?? [];
          final friendPosts = snapshot.data?.friendPosts ?? [];
          return ListView(
            children: [
              TodayRecipeListView(recipes: recipes),
              const SizedBox(
                height: 16,
              ),
              FriendPostListView(friendPosts: friendPosts)
            ],
            scrollDirection: Axis.vertical,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
