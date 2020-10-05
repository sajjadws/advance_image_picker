import 'package:advanceimagepicker/advanceimagepicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestProfileImageSelector extends StatefulWidget {
  TestProfileImageSelector({Key key}) : super(key: key);

  @override
  _TestProfileImageSelectorState createState() =>
      _TestProfileImageSelectorState();
}

class _TestProfileImageSelectorState extends State<TestProfileImageSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
              const Color(0xFF303aff),
              const Color(0xFF0009b8),
            ], stops: [
              0,
              1.0
            ], radius: 0.7, tileMode: TileMode.clamp)),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                AdvanceImagePicker(
                  altImage: "assets/images/profile_logo.png",
                  networkImage:
                  "https://elmineh.ir/wp-content/uploads/2018/05/017.jpg",
                  aspectRatio: 1 / 1,
                  size: MediaQuery.of(context).size.height / 5,
                  useCropper: true,
                  bubbleColor: Colors.white,
                  fileAdded: (file) {},
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "TIME TO CHOOSE YOUR IMAGE",
                  style: TextStyle(
                      fontFamily: "Ace Records",
                      fontSize: 24,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Align(
              alignment: Alignment(0, .95),
              child: Text(
                "Made by : Sajjad Arvin",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}