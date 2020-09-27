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
      body: AdvanceImagePicker(
        altImage: "assets/images/profile_logo.png",
        networkImage:
        "https://elmineh.ir/wp-content/uploads/2018/05/017.jpg",
        aspectRatio: 1 / 1,
        size: MediaQuery.of(context).size.height / 5,
        useCropper: false,
        bubbleColor: Colors.white,
        fileAdded: (file) {

        },
      ),
    );
  }
}