// import 'package:flutter/material.dart';

// import 'recipe.dart';

// class RecipeDetail extends StatefulWidget {
//   final Recipe recipe;

//   const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

//   @override
//   _RecipeDetailState createState() {
//     return _RecipeDetailState();
//   }
// }

// class _RecipeDetailState extends State<RecipeDetail> {
//   int _sliderVal = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.recipe.label)),

//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               height: 300,
//               width: double.infinity,
//               child: Image(image: AssetImage(widget.recipe.imageUrl)),
//             ),

//             const SizedBox(height: 4),

//             Text(widget.recipe.label, style: const TextStyle(fontSize: 18)),

//             Expanded(
//               child: ListView.builder(
//                 padding: const EdgeInsets.all(7.0),
//                 itemCount: widget.recipe.ingredients.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final ingredient = widget.recipe.ingredients[index];
//                   return Text(
//                     '${ingredient.quantity * _sliderVal} '
//                     '${ingredient.measure} '
//                     '${ingredient.name}',
//                   );
//                 },
//               ),
//             ),

//             Slider(
//               min: 1,
//               max: 10,
//               divisions: 10,
//               label: '${_sliderVal * widget.recipe.servings} servings',
//               value: _sliderVal.toDouble(),
//               onChanged: (newValue) {
//                 setState(() {
//                   _sliderVal = newValue.round();
//                 });
//               },
//               activeColor: Colors.green,
//               inactiveColor: Colors.black,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'recipe.dart';

class RecipeDetailPage extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailPage({super.key, required this.recipe});

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  double servings = 2;

  @override
  void initState() {
    super.initState();

    servings = widget.recipe.baseServings.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF3F1),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                /// SECTION 1 + 2

                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 0),

                      height: 280,

                      width: double.infinity,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                        image: DecorationImage(
                          image: AssetImage(widget.recipe.image),

                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        _iconButton(Icons.arrow_back_ios_new, () {
                          Navigator.pop(context);
                        }),

                        _iconButton(Icons.favorite_border, () {
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
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// SECTION 3
                Text(
                  widget.recipe.name,
                  style: GoogleFonts.baskervville(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 28),

                /// SECTION 4
                Text(
                  'Description',
                  style: GoogleFonts.baskervville(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  widget.recipe.description,
                  style: GoogleFonts.baskervville(fontSize: 16, height: 1.6),
                ),

                const SizedBox(height: 30),

                /// SECTION 5
                Text(
                  'Ingredients',
                  style: GoogleFonts.baskervville(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 12),

                ...widget.recipe.ingredients.map((ingredient) {
                  double adjustedQuantity =
                      ingredient.quantity *
                      (servings / widget.recipe.baseServings);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 10,
                          color: Color(0xFF728A44),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Text(
                            '${adjustedQuantity.toStringAsFixed(1)} '
                            '${ingredient.unit} '
                            '${ingredient.name}',

                            style: GoogleFonts.baskervville(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                }),

                const SizedBox(height: 40),

                /// SECTION 6
                Text(
                  'Servings',
                  style: GoogleFonts.baskervville(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  '${servings.toInt()} Persons',
                  style: GoogleFonts.baskervville(fontSize: 16),
                ),

                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: const Color(0xFFB7CA79),

                    inactiveTrackColor: const Color(0xFFE2E2E2),

                    thumbColor: const Color(0xFF728A44),

                    overlayColor: const Color(0xFF728A44),
                  ),

                  child: Slider(
                    min: 1,
                    max: 10,

                    value: servings,

                    onChanged: (value) {
                      setState(() {
                        servings = value;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 56,
        width: 56,

        decoration: BoxDecoration(
          color: const Color(0xFFB7CA79),

          borderRadius: BorderRadius.circular(18),
        ),

        child: Icon(icon, color: Colors.black),
      ),
    );
  }
}
