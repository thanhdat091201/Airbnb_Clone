import 'package:front_end/ui/commons/text_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginOptionTile extends StatelessWidget {
  final String icon;
  final String title;

  const LoginOptionTile({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 12),
          SvgPicture.asset(
            icon,
            // ImageConstants.profileIcon,
            height: 24,
            width: 24,
          ),
          Expanded(
            child: AppText(
            title: title,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            titleTextAlign: TextAlign.center,
          ),
          )
        ],
      ),
    );
  }
}
