import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: SpinKitFadingCube(
          color: Colors.blue,
          size: 100.0,
        ),
      ),
    );
  }
}