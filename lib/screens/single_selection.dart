import 'package:flutter/material.dart';

class SingleSelection extends StatefulWidget {
  const SingleSelection({super.key});

  @override
  State<SingleSelection> createState() => _SingleSelectionState();
}

class _SingleSelectionState extends State<SingleSelection> {
  List<Map> animals = [
    {"name": "Cow", "image": "assets/animals/cow.png"},
    {"name": "Deer", "image": "assets/animals/deer.png"},
    {"name": "Lion", "image": "assets/animals/lion.png"},
    {"name": "Tiger", "image": "assets/animals/tiger.png"},
    {"name": "Giraffe", "image": "assets/animals/giraffe.png"},
    {"name": "Pingeon", "image": "assets/animals/pingeon.png"},
    {"name": "Rat", "image": "assets/animals/rat.png"},
    {"name": "White Tiger", "image": "assets/animals/white-tiger.png"},
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,

      body: Padding(
        padding: const EdgeInsets.all(30),
        child: GridView.builder(
          itemCount: animals.length,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 7,
            crossAxisSpacing: 10,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            // Selected item will be highlighted with pink color and the rest will be in grey color
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AnimatedScale(
                scale: selectedIndex == index ? 1.1 : 1.0,

                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  // items
                  child: Stack(
                    children: [
                      selectedIndex == index
                          ?
                            //Send button background container
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                    colors: [Colors.black12, Colors.black26],
                                  ),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),

                      // image and name of the animal
                      Column(
                        children: [
                          Image.asset(
                            width: MediaQuery.of(context).size.width * 0.3,
                            animals[index]["image"],
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          selectedIndex == index
                              ? SizedBox.shrink()
                              : Text(
                                  (animals[index]["name"]).toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey,
                                  ),
                                ),
                        ],
                      ),

                      //Send button
                      selectedIndex == index
                          ? Positioned(
                              bottom: 35,
                              right: 0,
                              left: 0,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(4),
                                ),

                                child: Center(
                                  child: Text(
                                    "Send",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
