import 'dart:io';

import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:flutter/material.dart';

class ProfileUserAvatar extends StatelessWidget {
  const ProfileUserAvatar({
    super.key,
    required this.imagePath,
    this.isAddPhoto = false,
    this.onPressed,
    this.isFileImage = false,
    this.fileImage,
  });

  final String imagePath;
  final bool isAddPhoto;
  final void Function()? onPressed;
  final bool isFileImage;
  final File? fileImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * .3,
            width: MediaQuery.of(context).size.width * .35,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: isFileImage
                ? Image(
                    image: FileImage(fileImage!),
                    fit: BoxFit.fill,
                  )
                : Image.network(
                    "${AppServerLinks.imageUserAvatar}/$imagePath",
                    fit: BoxFit.fill,
                  ),
          ),
          Visibility(
            visible: isAddPhoto,
            child: Positioned(
              right: 5,
              bottom: 5,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: AppColors.primaryColor,
                ),
                child: IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
