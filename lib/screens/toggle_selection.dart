import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleSelection extends StatefulWidget {
  const ToggleSelection({super.key});

  @override
  State<ToggleSelection> createState() => _ToggleSelectionState();
}

class _ToggleSelectionState extends State<ToggleSelection> {
  bool isFollow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),

            Stack(
              clipBehavior: Clip.none,
              children: [
                //MAIN IMAGE
                CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: AssetImage("assets/Sample_User_Icon.png"),
                  radius: 110,
                ),

                //FOLLOW BUTTON
                Positioned(
                  bottom: -25,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFollow = !isFollow;
                      });
                    },
                    child: CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        isFollow
                            ? CupertinoIcons.check_mark
                            : CupertinoIcons.add,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 80),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isFollow ? CupertinoIcons.check_mark : CupertinoIcons.add,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text("Arwa Radwan", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
