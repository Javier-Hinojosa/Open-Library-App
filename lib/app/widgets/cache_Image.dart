
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:open_library/app/widgets/containers/container.shimmer.widget.dart';
import 'package:open_library/core/values/paths.dart';

class CustomCacheImage extends StatelessWidget {
  final String url;
  final BoxFit? boxFit;

  const CustomCacheImage(
      {
        super.key,
        required this.url,
        this.boxFit,
      });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: CachedNetworkImage(
          height: MediaQuery.of(context).size.height * 0.2,
            placeholder: (context, url) => CustomShimmer(height: MediaQuery.of(context).size.height * 0.2),
            width: MediaQuery.of(context).size.width,
            imageUrl: url,
          fit: boxFit?? BoxFit.fill, // Ajustar la imagen al tamaño del Card
          errorWidget: (context, url, error) => Image.asset(
            Paths.bookError,
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width)));
  }
}