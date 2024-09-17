import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  TRoundedImage({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.width,
    this.height,
    this.applyImageRadius = true,
    required this.imageurl,
    this.fit = BoxFit.contain,
    this.backgroundColor = AppColors.light,
    this.borderRadius = Sizes.md,
  }) : isNetworkImage = imageurl.startsWith('http');

  final double? width;
  final double? height;
  final String imageurl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final BoxFit? fit;
  final Color backgroundColor;
  final bool isNetworkImage;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Sizes.md)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.md),
        child: Image(
          fit: fit,
          image: isNetworkImage
              ? NetworkImage(imageurl)
              : AssetImage(imageurl) as ImageProvider,
        ),
      ),
    );
  }
}




















// import 'package:flutter/material.dart';
//
// import '../../../utils/constants/sizes.dart';
//
// class RoundedImage extends StatelessWidget {
//   const RoundedImage({
//     super.key,
//     this.width,
//     this.height,
//     required this.imageUrl,
//     this.applyImageRadius = false,
//     this.border,
//     this.backgroundColor,
//     this.fit = BoxFit.contain,
//     this.padding,
//     this.isNetworkImage = false,
//     this.onPressed,
//     this.borderRadius = Sizes.md,
//   });
//
//   final double? width, height;
//   final String imageUrl;
//   final bool applyImageRadius;
//   final BoxBorder? border;
//   final Color? backgroundColor;
//   final BoxFit? fit;
//   final EdgeInsetsGeometry? padding;
//   final bool isNetworkImage;
//   final VoidCallback? onPressed;
//   final double borderRadius;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         width: width,
//         height: height,
//         padding: padding,
//         decoration: BoxDecoration(border: border, color: backgroundColor, borderRadius: BorderRadius.circular(borderRadius)),
//         child: ClipRRect(
//           borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
//           child: Image(image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider, fit: fit),
//         ),
//       ),
//     );
//   }
// }
