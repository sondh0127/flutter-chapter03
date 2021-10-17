import 'package:chapter03/components/friend_post_tile.dart';
import 'package:chapter03/models/post.dart';
import 'package:flutter/material.dart';

class FriendPostListView extends StatelessWidget {
  final List<Post> friendPosts;
  const FriendPostListView({
    Key? key,
    required this.friendPosts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Social Chefs 👩‍🍳',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.separated(
            primary: false,
            // // 3
            physics: const NeverScrollableScrollPhysics(),
            // // 4
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: friendPosts.length,
            itemBuilder: (context, index) {
              final post = friendPosts[index];
              return FriendPostTile(post: post);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
