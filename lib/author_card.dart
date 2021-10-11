import 'package:chapter03/circle_image.dart';
import 'package:chapter03/fooderlich_theme.dart';
import 'package:flutter/material.dart';

class AuthorCard extends StatelessWidget {
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  const AuthorCard({
    Key? key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(
                imageProvider: imageProvider,
                imageRadius: 28,
              ),
              const SizedBox(width: 8),
              Column(
                children: [
                  Text(
                    authorName,
                    style: FooderlichTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    title,
                    style: FooderlichTheme.lightTextTheme.headline3,
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              const snackBar = SnackBar(
                content: Text('Favorite Pressed'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: const Icon(Icons.favorite_border),
            iconSize: 30,
            color: Colors.grey[400],
          )
        ],
      ),
    );
  }
}
