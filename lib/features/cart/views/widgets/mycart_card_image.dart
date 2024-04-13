import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:flutter/material.dart';

class MyCartCardImage extends StatelessWidget {
  const MyCartCardImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.width * .25,
          width: MediaQuery.of(context).size.width * .28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.primaryForegroundColor,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 16,
          right: 16,
          child: CachedNetworkImage(
            imageUrl: "${AppServerLinks.imageItemsPath}/$image",
            height: MediaQuery.of(context).size.width * .22,
            width: MediaQuery.of(context).size.width * .22,
          ),
        ),
      ],
    );
  }
}
