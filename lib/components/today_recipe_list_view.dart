import 'package:chapter03/components/components.dart';
import 'package:chapter03/models/explore_recipe.dart';
import 'package:flutter/material.dart';

class TodayRecipeListView extends StatelessWidget {
  const TodayRecipeListView({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  final List<ExploreRecipe> recipes;

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
            'Recipes of the Day 🍳',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 16),
          Container(
            height: 400,
            color: Colors.transparent,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return buildCard(recipe);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 16,
                );
              },
              itemCount: recipes.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception('This card doesn\'t exist yet');
    }
  }
}
