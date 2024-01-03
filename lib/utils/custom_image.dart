
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/images.dart';
import 'package:flutter_svg/flutter_svg.dart';


// class CustomImage extends StatelessWidget {
//   final String image;
//   final double? height;
//   final double? width;
//   final BoxFit? fit;
//   final String placeholder;
//   const CustomImage({Key? key, required this.image, this.height, this.width, this.fit = BoxFit.cover, this.placeholder = ''}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       imageUrl: image, height: height, width: width, fit: fit,
//       placeholder: (context, url) => Image.asset(placeholder.isNotEmpty ? placeholder : Images.placeholder, height: height, width: width, fit: fit),
//       errorWidget: (context, url, error) => Image.asset(placeholder.isNotEmpty ? placeholder : Images.placeholder, height: height, width: width, fit: fit),
//     );
//   }
// }

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    required this.path,
    this.fit = BoxFit.contain,
    this.height,
    this.width,
    this.color,
    this.isFile = false,
    this.placeholder = ''
  }) : super(key: key);
  final String? path;
  final BoxFit fit;
  final double? height, width;
  final Color? color;
  final bool isFile;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    final imagePath = path ?? Images.kNetworkImage;

    if (isFile) {
      return Image.file(
        File(imagePath),
        fit: fit,
        color: color,
        height: height,
        width: width,
      );
    }

    if (imagePath.endsWith('.svg')) {
      return SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          imagePath,
          fit: fit,
          height: height,
          width: width,
          color: color,
        ),
      );
    }
    if (imagePath.startsWith('http') ||
        imagePath.startsWith('https') ||
        imagePath.startsWith('www.')) {
      return CachedNetworkImage(
      imageUrl: imagePath, height: height, width: width, fit: fit,
      placeholder: (context, url) => Image.asset(placeholder.isNotEmpty ? placeholder : Images.placeholder, height: height, width: width, fit: fit),
      errorWidget: (context, url, error) => Image.asset(placeholder.isNotEmpty ? placeholder : Images.placeholder, height: height, width: width, fit: fit),
    );
      // CachedNetworkImage(
      //   imageUrl: imagePath,
      //   fit: fit,
      //   color: color,
      //   height: height,
      //   width: width,
      //   progressIndicatorBuilder: (context, url, downloadProgress) => Center(
      //       child: CircularProgressIndicator(value: downloadProgress.progress)),
      //   errorWidget: (context, url, error) => const Icon(Icons.error),
      // );
    }
    return Image.asset(
      imagePath,
      fit: fit,
      color: color,
      height: height,
      width: width,
    );
  }
}
