import 'package:flutter/material.dart';

class ThumbnailTap extends StatefulWidget {
  _ThumbnailTapState createState() => _ThumbnailTapState();
}

class _ThumbnailTapState extends State<ThumbnailTap> {
  bool _isImageShown = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Thumbnail Tap Image Example'),
      ),
      body: Stack(
        children: <Widget>[
          !_isImageShown
              ? Center(
                  child: GestureDetector(
                    onTap: () => setState(() => _isImageShown = !_isImageShown),
                    child: new Image.asset(
                      'assets/profile.jpg',
                      width: 90,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : SizedBox(),
          _isImageShown
              ? Center(
                  child: new Image.asset(
                    'assets/profile.jpg',
                    width: size.width,
                    height: size.height,
                    fit: BoxFit.fill,
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}