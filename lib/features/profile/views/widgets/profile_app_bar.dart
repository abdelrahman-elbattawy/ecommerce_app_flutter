import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/functions/goto_tile_body_func.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
    required this.title,
    required this.backViewId,
  });

  final String title;
  final int backViewId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => goToTileBody(backViewId),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        const Spacer(),
        Text(
          title,
          style: AppTextStyle.textStyle20,
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
