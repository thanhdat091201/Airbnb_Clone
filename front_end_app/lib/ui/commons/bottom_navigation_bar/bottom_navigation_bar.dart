import 'dart:math';
import 'package:front_end/infrastructure/commons/constants/image_constants.dart';
import 'package:front_end/infrastructure/providers/provider_registration.dart';
import 'package:front_end/ui/commons/text_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationbar extends ConsumerStatefulWidget {
  const BottomNavigationbar({super.key});

  @override
  ConsumerState<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends ConsumerState<BottomNavigationbar> {
  bool hasBottomNotch = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final padding = MediaQuery.of(context).padding;
      if (padding.bottom > 0) {
        setState(() {
          hasBottomNotch = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeProviderWatch = ref.watch(homeProvider);
    final homeProviderRead = ref.read(homeProvider);
    return AnimatedContainer(
        // curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 30),
        height: homeProviderWatch.isMapButtonVisible >= 1.0
            ? hasBottomNotch
                ? 70
                : 60
            : max(homeProviderWatch.isMapButtonVisible * 70 - 20, 0),
        color: const Color(0xFFFFFFFF),
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Color(0xFFEBEBEB)),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < data.length; i++)
                      GestureDetector(
                        onTap: () {
                          homeProviderRead.setIsIndex(i);
                        },
                        child: BottomIconName(
                          title: data[i]['title']!,
                          icon: data[i]['icon']!,
                          colorIcon: homeProviderWatch.isIndex != i ? const Color(0xFFB0B0B0) : Color.fromARGB(255, 212, 36, 36),
                          colorTitle:
                              homeProviderWatch.isIndex != i ? const Color(0xFF222222) : const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: homeProviderWatch.isIndex != i ? FontWeight.w400 : FontWeight.w500,
                        ),
                      )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class BottomIconName extends StatelessWidget {
  final String title;
  final String icon;
  final Color colorIcon;
  final Color colorTitle;
  final FontWeight fontWeight;
  const BottomIconName(
      {super.key,
      required this.title,
      required this.icon,
      required this.colorIcon,
      required this.colorTitle,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: SvgPicture.asset(
              icon,
              width: 26,
              height: 26,
              color: colorIcon,
            ),
          ),
          const SizedBox(height: 2),
          AppText(
            title: title,
            fontSize: 10,
            titleColor: colorTitle,
            fontWeight: fontWeight,
          )
        ],
      ),
    );
  }
}

const data = [
  {
    "title": "Explore",
    "icon": ImageConstants.exploreIcon,
  },
  {
    "title": "Wishlists",
    "icon": ImageConstants.wishlistsIcon,
  },
  {
    'icon': ImageConstants.tripsIcon,
    'title': 'Trips',
  },
  {
    'icon': ImageConstants.inboxIcon,
    'title': 'Inbox',
  },
  {
    'icon': ImageConstants.profileIcon,
    'title': 'Profile',
  }
];
