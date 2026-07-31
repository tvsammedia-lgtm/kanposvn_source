import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/cafe_providers.dart';

class MenuRecipeScreen extends ConsumerWidget {
  const MenuRecipeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuItems = ref.watch(cafeMenuProvider);
    final recipes = ref.watch(cafeRecipesProvider);
    final currency = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'đ',
      decimalDigits: 0,
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: const TabBar(
            indicatorColor: Color(0xFFD97706),
            labelColor: Color(0xFFD97706),
            tabs: [
              Tab(
                icon: Icon(Icons.restaurant_menu),
                text: 'Danh Sách Món (Menu)',
              ),
              Tab(
                icon: Icon(Icons.blender),
                text: 'Công Thức Pha Chế (Recipe)',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Menu Items List
            ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: menuItems.length,
              itemBuilder: (ctx, i) {
                final item = menuItems[i];
                final hasRecipe = recipes.any((r) => r.menuItemId == item.id);

                return Card(
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFFEF3C7),
                      child: Icon(Icons.coffee, color: Color(0xFFD97706)),
                    ),
                    title: Text(
                      '${item.name} (${item.code})',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${item.categoryName} • ${currency.format(item.basePrice)} • Size: ${item.sizes.map((s) => s.name).join(', ')}',
                    ),
                    trailing: Chip(
                      avatar: Icon(
                        hasRecipe ? Icons.check_circle : Icons.warning_amber,
                        size: 16,
                        color: hasRecipe ? Colors.green : Colors.orange,
                      ),
                      label: Text(
                        hasRecipe ? 'Đã có định lượng' : 'Chưa gắn công thức',
                        style: const TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                );
              },
            ),
            // Tab 2: Recipes List
            ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: recipes.length,
              itemBuilder: (ctx, i) {
                final r = recipes[i];
                return Card(
                  child: ExpansionTile(
                    leading: const Icon(Icons.science, color: Colors.purple),
                    title: Text(
                      'Công thức: ${r.menuItemName}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Gồm ${r.ingredients.length} nguyên liệu tiêu hao',
                    ),
                    children: r.ingredients.map((ing) {
                      return ListTile(
                        dense: true,
                        leading: const Icon(Icons.arrow_right),
                        title: Text(ing.ingredientName),
                        trailing: Text(
                          '${ing.quantity} ${ing.unit}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
