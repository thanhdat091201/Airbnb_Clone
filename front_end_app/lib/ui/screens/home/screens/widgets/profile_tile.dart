import 'package:front_end/infrastructure/commons/constants/image_constants.dart';
import 'package:front_end/ui/commons/text_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileTile extends StatelessWidget {
  final String icon;
  final String title;

  const ProfileTile({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            // ImageConstants.profileIcon,
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 16),
          AppText(title: title, fontSize: 16, titleColor: const Color(0xFF222222)),
          const Spacer(),
          SvgPicture.asset(
            ImageConstants.arrowRightIcon,
            height: 16,
            width: 16,
          )
        ],
      ),
    );
  }
}
