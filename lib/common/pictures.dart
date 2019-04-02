import 'package:flutter/material.dart';

class CaptionedImage extends StatelessWidget {
  final String image;
  final String caption;

  const CaptionedImage({Key key, this.image, this.caption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover))),
          Text(
            caption,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
      margin: EdgeInsets.all(10),
    );
  }
}
