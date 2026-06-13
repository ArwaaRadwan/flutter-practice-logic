import 'package:flutter/material.dart';

class ImageSelection extends StatefulWidget {
  const ImageSelection({super.key});

  @override
  State<ImageSelection> createState() => _ImageSelectionState();
}

class _ImageSelectionState extends State<ImageSelection> {
  List<String> images = [
    "assets/laptops/labtop1.png",
    "assets/laptops/labtop3.png",
    "assets/laptops/labtop2.png",
    "assets/laptops/labtop4.png",
    "assets/laptops/labtop1.png",
    "assets/laptops/labtop3.png",
    "assets/laptops/labtop2.png",
    "assets/laptops/labtop4.png",
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xcbfdee00),
      body: Column(
        children: [
          SizedBox(height: 90),
          //MAIN IMAGE
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.asset(images[selectedIndex], fit: BoxFit.cover),
          ),
          SizedBox(height: 30),

          //OTHER IMAGES
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: List.generate(images.length, (index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        border: Border.all(
                          color: selectedIndex == index
                              ? Colors.blue
                              : Colors.white,
                        ),
                      ),
                      child: Image.asset(images[index], fit: BoxFit.contain),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
