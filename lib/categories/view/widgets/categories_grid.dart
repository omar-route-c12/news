import 'package:flutter/material.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/categories/view/widgets/category_item.dart';
import 'package:news/categories/data/models/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({
    super.key,
    required this.onCategorySelected,
  });

  final void Function(CategoryModel) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      const CategoryModel(
        id: 'sports',
        name: 'Sports',
        imageName: 'sports',
        color: AppTheme.red,
      ),
      const CategoryModel(
        id: 'business',
        name: 'Business',
        imageName: 'sports',
        color: AppTheme.red,
      ),
      const CategoryModel(
        id: 'sports',
        name: 'Sports',
        imageName: 'sports',
        color: AppTheme.red,
      ),
      const CategoryModel(
        id: 'sports',
        name: 'Sports',
        imageName: 'sports',
        color: AppTheme.red,
      ),
      const CategoryModel(
        id: 'sports',
        name: 'Sports',
        imageName: 'sports',
        color: AppTheme.red,
      ),
      const CategoryModel(
        id: 'sports',
        name: 'Sports',
        imageName: 'sports',
        color: AppTheme.red,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'Pick your category of interest',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppTheme.navy),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
              itemBuilder: (_, index) {
                CategoryModel category = categories[index];
                return GestureDetector(
                  onTap: () {
                    onCategorySelected(category);
                  },
                  child: CategoryItem(
                    category: category,
                    index: index,
                  ),
                );
              },
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
