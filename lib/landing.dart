import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'styles.dart';
import 'recipe.dart';
import 'recipe_detail.dart';
import 'ingredient.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'Breakfast';
  String searchQuery = '';

  final List<Recipe> recipes = [
    Recipe(
      name: 'Spaghetti & Meatball',
      image: 'assets/images/spaghetti.jpg',
      category: 'Lunch',
      description: 'Classic Italian spaghetti served with homemade meatballs and rich tomato sauce.',
      baseServings: 2,
      ingredients: [
        Ingredient(name: 'Spaghetti', quantity: 200, unit: 'g'),
        Ingredient(name: 'Meatballs', quantity: 4, unit: 'pcs'),
        Ingredient(name: 'Tomato Sauce', quantity: 150, unit: 'ml'),
        Ingredient(name: 'Parmesan Cheese', quantity: 30, unit: 'g'),
      ],
    ),
    Recipe(
      name: 'Nasi Kerabu',
      image: 'assets/images/nasi_kerabu.jpg',
      category: 'Lunch',
      description: 'A traditional Malaysian dish featuring blue rice, fresh herbs, and a variety of accompaniments.',
      baseServings: 2,
      ingredients: [
        Ingredient(name: 'Blue Rice', quantity: 200, unit: 'g'),
        Ingredient(name: 'Herbs', quantity: 50, unit: 'g'),
        Ingredient(name: 'Grilled Chicken', quantity: 150, unit: 'g'),
        Ingredient(name: 'Sambal', quantity: 30, unit: 'g'),
      ],
    ),
    Recipe(
      name: 'Lasagna',
      image: 'assets/images/lasagna.jpg',
      category: 'Dinner',
      description:
          'Layers of pasta, cheese, and meat sauce baked to perfection.',
      baseServings: 2,
      ingredients: [
        Ingredient(name: 'Lasagna Sheets', quantity: 200, unit: 'g'),
        Ingredient(name: 'Ground Beef', quantity: 250, unit: 'g'),
        Ingredient(name: 'Tomato Sauce', quantity: 200, unit: 'ml'),
        Ingredient(name: 'Mozzarella Cheese', quantity: 100, unit: 'g'),
      ],
    ),
    Recipe(
      name: 'Daging Dendeng',
      image: 'assets/images/daging_dendeng.jpg',
      category: 'Dinner',
      description: 'Thinly sliced beef marinated and fried to a crispy texture, served with rice.',
      baseServings: 2,
      ingredients: [
        Ingredient(name: 'Beef', quantity: 200, unit: 'g'),
        Ingredient(name: 'Marinade', quantity: 50, unit: 'ml'),
        Ingredient(name: 'Rice', quantity: 150, unit: 'g'),
      ],
    ),
    Recipe(
      name: 'Pancake',
      image: 'assets/images/pancake.jpg',
      category: 'Breakfast',
      description: 'Fluffy pancakes served with syrup and fresh fruits.',
      baseServings: 2,
      ingredients: [
        Ingredient(name: 'Flour', quantity: 100, unit: 'g'),
        Ingredient(name: 'Milk', quantity: 150, unit: 'ml'),
        Ingredient(name: 'Eggs', quantity: 2, unit: 'pcs'),
        Ingredient(name: 'Maple Syrup', quantity: 30, unit: 'ml'),
      ],
    ),
    Recipe(
      name: 'Croissant',
      image: 'assets/images/croissant.jpg',
      category: 'Breakfast',
      description:
          'Buttery and flaky French pastry, perfect for breakfast or a snack.',
      baseServings: 2,
      ingredients: [
        Ingredient(name: 'Flour', quantity: 200, unit: 'g'),
        Ingredient(name: 'Butter', quantity: 100, unit: 'g'),
        Ingredient(name: 'Yeast', quantity: 5, unit: 'g'),
        Ingredient(name: 'Milk', quantity: 100, unit: 'ml'),
      ],
    ),
    Recipe(
      name: 'Nasi Lemak with Chicken',
      image: 'assets/images/nasi_lemak_with_chicken.jpg',
      category: 'Breakfast',
      description: 'A Malaysian favorite, coconut milk rice served with fried chicken, sambal, and accompaniments.',
      baseServings: 2,
      ingredients: [
        Ingredient(name: 'Coconut milk rice', quantity: 150, unit: 'g'),
        Ingredient(name: 'Fried chicken', quantity: 200, unit: 'g'),
        Ingredient(name: 'Sambal sauce', quantity: 50, unit: 'ml'),
        Ingredient(name: 'Boiled egg', quantity: 2, unit: 'pcs'),
      ],
    ),
    Recipe(
      name: 'Bihun Goreng',
      image: 'assets/images/bihun_goreng.jpg',
      category: 'Breakfast',
      description: 'Stir-fried rice vermicelli with vegetables and your choice of protein.',
      baseServings: 2,
      ingredients: [
        Ingredient(name: 'Rice vermicelli', quantity: 100, unit: 'g'),
        Ingredient(name: 'Vegetables', quantity: 150, unit: 'g'),
        Ingredient(name: 'Soy sauce', quantity: 30, unit: 'ml'),
        Ingredient(name: 'Protein of choice', quantity: 200, unit: 'g'),
      ],
    ),
    Recipe(
      name: 'Coffee',
      image: 'assets/images/coffee.jpg',
      category: 'Drink',
      description: 'Freshly brewed coffee, perfect for a morning boost or an afternoon pick-me-up.',
      baseServings: 2,
      ingredients: [
        Ingredient(name: 'Coffee beans', quantity: 20, unit: 'g'),
        Ingredient(name: 'Water', quantity: 200, unit: 'ml'),
        Ingredient(name: 'Sugar', quantity: 10, unit: 'g'),
        Ingredient(name: 'Milk', quantity: 50, unit: 'ml'),
      ],
    ),
    Recipe(
      name: 'Milo Dinosour',
      image: 'assets/images/air_milo_dinosour.jpg',
      category: 'Drink',
      description: 'A refreshing Milo drink served with ice and a hint of chocolate flavor, perfect for hot days.',
      baseServings: 2,
      ingredients: [
        Ingredient(name: 'Milo powder', quantity: 30, unit: 'g'),
        Ingredient(name: 'Water', quantity: 150, unit: 'ml'),
        Ingredient(name: 'Ice cubes', quantity: 100, unit: 'g'),
        Ingredient(name: 'Sugar', quantity: 10, unit: 'g'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredRecipes = recipes.where((recipe) {
      bool categoryMatch = recipe.category == selectedCategory;

      bool searchMatch = recipe.name.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );

      return categoryMatch && searchMatch;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.softPink,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              /// SECTION 1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recipe App',
                    style: GoogleFonts.baskervville(
                      fontSize: 32,
                      color: AppColors.black,
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'Coming Soon',
                            style: GoogleFonts.baskervville(),
                          ),
                          content: Text(
                            'This function is not developed yet. Thank you for your understanding.',
                            style: GoogleFonts.baskervville(),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.mediumGreen,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// SECTION 2
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },

                decoration: InputDecoration(
                  hintText: 'What to eat?',
                  prefixIcon: const Icon(Icons.search),

                  filled: true,

                  fillColor: Colors.grey.shade200,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// SECTION 3
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  categoryTab('Breakfast'),
                  categoryTab('Lunch'),
                  categoryTab('Dinner'),
                  categoryTab('Drink'),
                ],
              ),

              const SizedBox(height: 24),

              /// SECTION 4
              Expanded(
                child: GridView.builder(
                  itemCount: filteredRecipes.length,

                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.95,
                  ),

                  itemBuilder: (context, index) {
                    final recipe = filteredRecipes[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RecipeDetailPage(recipe: recipe),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 140,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(recipe.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(recipe.name),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryTab(String title) {
    bool isSelected = selectedCategory == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
      },

      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.baskervville(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),

          const SizedBox(height: 4),

          Container(
            height: 2,
            width: 55,
            color: isSelected ? Colors.black : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
