import 'package:flutter/material.dart';
import 'package:practice_logic/screens/multi_selection.dart';
import 'package:practice_logic/screens/toggle_selection.dart';
import 'package:practice_logic/screens/single_selection.dart';
import 'package:practice_logic/screens/image_selection.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final PageController controller = PageController();
  List<Widget> screens = [
    SingleSelection(),
    ImageSelection(),
    ToggleSelection(),
    MultiSelection()
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Back Button
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    controller.jumpToPage(selectedIndex - 1);
                  });
                },
                icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
              ),
            ),
            // Spacing between buttons
            SizedBox(width: 10),
            // Next Button
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(color: Colors.black),
              child: Row(
                children: [
                  Text(
                    "Next Page",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        controller.jumpToPage(selectedIndex + 1);
                      });
                    },
                    icon: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
