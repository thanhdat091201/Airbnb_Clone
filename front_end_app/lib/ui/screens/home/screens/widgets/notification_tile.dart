import 'package:front_end/infrastructure/commons/constants/image_constants.dart';
// import 'package:front_end/infrastructure/providers/provider_registration.dart';
import 'package:front_end/ui/commons/text_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationTile extends StatelessWidget {
  final String title;

  const NotificationTile({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            height: 48,
            width: 48,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),
                color: const Color(0xFF008489)),
            child: SvgPicture.asset(
              ImageConstants.tripsIcon,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width - 158,
            child: AppText(
              title: title,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.visible,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {

                },
                child: SvgPicture.asset(
                  ImageConstants.closeIcon,
                  width: 16,
                  height: 16,
                ),
              )
          ),
        ],
      ),
    );
  }
}
