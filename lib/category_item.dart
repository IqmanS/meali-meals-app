import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(
      {super.key, required this.title, required this.color, required this.id});

  void selectCategory(BuildContext ctx, String categoryId, String categoryTitle,
      Color categoryColor) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return MealsScreen(
            categoryId: categoryId,
            categoryTitle: categoryTitle,
            categoryColor: categoryColor,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.6), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12)),
        child: Text(title, style: Theme.of(context).textTheme.headline1),
      ),
      onTap: () => selectCategory(context, id, title, color),
    );
  }
}