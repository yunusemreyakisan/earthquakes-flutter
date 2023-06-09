import 'package:flutter/material.dart';

class CustomMapImage extends StatelessWidget {
  final NetworkImage mapImage;

  const CustomMapImage({Key? key, required this.mapImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: mapImage,
            ),
          ),
        ),
      ],
    );


  }
}
