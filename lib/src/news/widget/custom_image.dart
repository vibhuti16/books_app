import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

dynamic CustomAdvanceNetworkImage(String path) {
  return CachedNetworkImageProvider(path);
}

class CustomImage extends StatelessWidget{

  final String path;
  final BoxFit fit;

  CustomImage(this.path,{this.fit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: CustomAdvanceNetworkImage(path),
      fit: fit,
      errorBuilder:
          ( context,  exception,  stackTrace) {
        return Container();
      },
    );
  }

}