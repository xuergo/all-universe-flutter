import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCachedNetworkImage extends StatelessWidget {
  final String imageurl;
  const MyCachedNetworkImage({Key? key, required this.imageurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: double.infinity,
      height: double.infinity,
      imageUrl: imageurl,
      placeholder: (_, __) =>
          Image.asset('lib/assets/images/common/jiazaizhong.png'),
      fit: BoxFit.cover,
    );
  }
}
