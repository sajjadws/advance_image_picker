import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:advanceimagepicker/global/constants/dims.dart';
import 'package:advanceimagepicker/images/image_selector/image_selector_result.dart';



class AdvanceProfileImageSelector extends StatefulWidget {
  final String networkImage;

  final size;

  final double aspectRatio;

  final bool useCropper;

  final Function(File image) fileAdded;

  final Color bubbleColor;

  final String altImage;

  AdvanceProfileImageSelector({
    this.aspectRatio,
    this.size,
    this.useCropper,
    this.networkImage,
    this.bubbleColor,
    this.fileAdded,
    @required this.altImage});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AdvanceProfileImageSelectorState();
  }
}

class AdvanceProfileImageSelectorState
    extends State<AdvanceProfileImageSelector> {
  File image;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ImageSelectorResult(

            useCropper: widget.useCropper,
            aspectRatio: widget.aspectRatio,
            child: Stack(
              fit: StackFit.loose,
              children: <Widget>[
                ClipOval(
                  child: Container(
                      width: widget.size,
                      height: widget.size,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(

                            border: Border.all(color: Theme
                                .of(context)
                                .accentColor, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                              child: imageContent()
                          ))),
                ),
                Container(
                  width: widget.size,
                  height: widget.size,
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: widget.size - (widget.size * 0.8509) - 16,
                        bottom: widget.size - (widget.size * 0.8509) - 16),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Theme
                          .of(context)
                          .accentColor),
                      child: Container(
                        margin: EdgeInsets.all(3),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.bubbleColor == null ? Theme
                                .of(context)
                                .accentColor:widget.bubbleColor),
                        child: Icon(
                          Icons.edit,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            onFileAdded: (file) {
              setState(() {
                image = file;
                widget.fileAdded(file);
              });
            }),

      ],
    );
  }

  imageContent() {
    if (image == null && widget.networkImage == null) {
      return Container(
        child: Image.asset(
            widget.altImage),
      );
    } else if (image == null && widget.networkImage != null) {
      return imageAspectRatio(
          imageWidget: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: widget.networkImage,
              placeholder: (context, url) =>
                  Center(
                    child: CircularProgressIndicator(),
                  ),
              errorWidget: (context, url, error) =>
                  Image.asset(
                      widget.altImage))
      );
    } else if (image != null && widget.networkImage != null) {
      return imageAspectRatio(
          imageWidget: Stack(

            children: <Widget>[
              CachedNetworkImage(
                  imageUrl: widget.networkImage,
                  placeholder: (context, url) =>
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                  errorWidget: (context, url, error) =>
                      Image.asset(
                          widget.altImage)),
              Image.file(
                image,
                fit: BoxFit.cover,
              )
            ],
          )
      );
    } else if (image != null && widget.networkImage == null) {
      return imageAspectRatio(
          imageWidget: Image.file(
            image,
            fit: BoxFit.cover,
          )
      );
    }
  }


  Widget imageAspectRatio({Widget imageWidget}) {
    return AspectRatio(
      aspectRatio: widget.aspectRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(Dims.commonBorderRadius),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            imageWidget,
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Color.fromARGB(150, 255, 88, 206)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
            ),

          ],
        ),
      ),
    );
  }



}
