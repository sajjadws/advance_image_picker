import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///this class is a snack bar but from top, and use for alerts
class OverlyAlert {
  static final int LENGTH_SHORT = 1;
  static final int LENGTH_LONG = 2;
  static final int BOTTOM = 0;
  static final int CENTER = 1;
  static final int TOP = 2;

  static void show(String msg, BuildContext context,
      {int duration = 1,
        int gravity = 0,
        Color backgroundColor = const Color(0xAA000000),
        Color textColor = Colors.white,
        double backgroundRadius = 20}) {
    OverlyAlertView.dismiss();
    OverlyAlertView.createView(
        msg, context, duration, gravity, backgroundColor, textColor, backgroundRadius);
  }
}

class OverlyAlertView {
  static final OverlyAlertView _singleton = new OverlyAlertView._internal();

  factory OverlyAlertView() {
    return _singleton;
  }

  OverlyAlertView._internal();

  static OverlayState overlayState;
  static OverlayEntry _overlayEntry;
  static bool _isVisible = false;

  static void createView(String msg, BuildContext context, int duration, int gravity,
      Color background, Color textColor, double backgroundRadius) async {
    overlayState = Overlay.of(context);



    _overlayEntry = new OverlayEntry(
      builder: (BuildContext context) => myAnims(
        text: msg,
          bgColor: background,
          textColor: textColor,
          duration: 1000,
          begin: -MediaQuery.of(context).size.height,
          end: -(MediaQuery.of(context).size.height * 5 / 6)),
    );
    _isVisible = true;
    overlayState.insert(_overlayEntry);
    await new Future.delayed(Duration(seconds: duration == null ? OverlyAlert.LENGTH_SHORT : duration));
    dismiss();
  }

  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}





class myAnims extends StatefulWidget {
  int duration;
  double begin;
  double end;
  Color bgColor = Colors.white;
  Color textColor = Colors.white;
  String text = "";

  myAnims({this.duration, this.begin, this.end, this.bgColor,this.text,this.textColor});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return myAnimsState();
  }
}

class myAnimsState extends State<myAnims> with TickerProviderStateMixin {
  AnimationController _controller;

  var animation;

  @override
  void initState() {

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );



    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();
    super.dispose();


  }

  @override
  Widget build(BuildContext context) {
    animation = Tween(begin: widget.begin, end: widget.end).animate(
      new CurvedAnimation(
          parent: _controller,
          curve: Curves.bounceOut
      ),
    );

    _controller.forward(from: 0.0);

    return AnimatedBuilder(
      animation: animation,
      child: Material(
        child: Container(
          decoration: BoxDecoration(color: widget.bgColor,
            border: Border(bottom: BorderSide(color: Colors.black38,width: 2))
          ),
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/20),
          alignment: Alignment.bottomCenter,

          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Text(widget.text, style: TextStyle(color: widget.textColor),),
        ),
      ),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: child,
        );
      },
    );
  }
}