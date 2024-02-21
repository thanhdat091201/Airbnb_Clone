import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteWidget extends ConsumerStatefulWidget {
  const FavoriteWidget({super.key});

  @override
  ConsumerState<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends ConsumerState<FavoriteWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView(
        children: [
          // for (var i = 0; i < rooms.length; i++)
          //   HomeCard(
          //     displayImage: rooms[i].displayImage,
          //     cardName: rooms[i].cardName,
          //     cardDistance: rooms[i].cardDistance,
          //     cardDate: rooms[i].cardDate,
          //     cardPrice: rooms[i].cardPrice,
          //     cardRating: rooms[i].cardRating,
          //     onTap: () {
          //       ref.read(homeProvider).recentData = i;
          //       Navigator.pushNamed(context, RouteConstants.detailsScreen);
          //     },
          //   ),
        ],
      ),
    );
  }
}