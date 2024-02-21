import 'package:front_end/infrastructure/commons/constants/image_constants.dart';
import 'package:front_end/ui/commons/text_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeCard extends StatefulWidget {
  final String displayImage;
  final String cardName;
  final String cardRating;
  final String cardDistance;
  final String cardDate;
  final String cardPrice;
  final VoidCallback onTap;
  final VoidCallback addToFavorites;


  const HomeCard(
      {super.key,
      required this.displayImage,
      required this.cardName,
      required this.cardDistance,
      required this.cardDate,
      required this.cardPrice,
      required this.cardRating,
      required this.onTap,
      required this.addToFavorites,

});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {

  bool isLiked = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
    widget.addToFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  child: Hero(
                    tag: widget.displayImage,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14.0),
                      child: Image.network(widget.displayImage,
                          // 'https://a0.muscache.com/im/pictures/miso/Hosting-605371928419351152/original/c8f48e8b-091d-47ea-85ac-b31bc2604bbb.jpeg?im_w=720',
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: GestureDetector(
                    onTap: toggleLike,
                    child: SvgPicture.asset(
                      isLiked ? ImageConstants.redheartIcon : ImageConstants.likeIcon,
                      width: 24,
                      height: 24,
                      color: isLiked ? const Color(0xFFBE1A1F) : Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                AppText(
                    title: widget.cardName,
                    // "Pimplad Nasik, India"
                    fontSize: 16),
                const Spacer(),
                SvgPicture.asset(ImageConstants.startIcon, height: 12),
                const SizedBox(width: 4),
                AppText(
                    title: widget.cardRating,
                    //  "5.0",
                    fontSize: 16),
              ],
            ),
            AppText(
                title: widget.cardDistance,
                // "134 kilometres away",
                fontSize: 16,
                titleColor: const Color(0xFF717171)),
            AppText(
                title: widget.cardDate,
                //  "12–19 Mar",
                fontSize: 16,
                titleColor: const Color(0xFF717171)),
            const SizedBox(height: 4),
            Row(
              children: [
                AppText(
                    title: widget.cardPrice,
                    // "₹20,697 ",
                    fontSize: 16),
                const AppText(title: "night", fontSize: 16, titleColor: Color(0xFF222222)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
