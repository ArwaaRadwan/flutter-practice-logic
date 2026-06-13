import 'package:flutter/material.dart';

class MultiSelection extends StatefulWidget {
  const MultiSelection({super.key});

  @override
  State<MultiSelection> createState() => _MultiSelectionState();
}

class _MultiSelectionState extends State<MultiSelection> {
  List<String> types = [
    "News",
    "Sports",
    "Entertainment",
    "Business & Finance",
    "Technology",
    "Fashion & Beauty",
    "Gaming",
    "Lifestyle",
    "Movies & TV",
    "Travel",
    "Music",
    "Food",
    "Comedy",
    "Health & Fitness",
  ];

  Set<String> emptyType = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            //MAIN TITTLE
            Text(
              "What do you want to see on X?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),

            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  //SELECTION LOGIC
                  children: List.generate(types.length, (index) {
                    final type = types[index];
                    final isSelected = emptyType.contains(type);

                    //SELECTION UI
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (!isSelected) {
                            emptyType.add(type);
                          } else {
                            emptyType.remove(type);
                          }
                        });
                      },
                      child: Stack(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.bounceInOut,
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 25,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.blue : Colors.black,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              type,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),

                          //CHEK ICON
                          if (isSelected)
                            const Positioned(
                              top: 8,
                              right: 8,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.check,
                                  size: 14,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
