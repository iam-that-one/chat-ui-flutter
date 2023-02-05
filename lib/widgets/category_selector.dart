import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({
    super.key,
  });

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = ['Messages', 'Online', 'Groups', 'Requests'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                child: Text(
                  categories[index],
                  style: TextStyle(
                      letterSpacing: 1.2,
                      color: index == selectedIndex ? Colors.white : Colors.white60,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
            );
          }),
    );
  }
}
