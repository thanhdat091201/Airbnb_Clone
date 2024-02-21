import 'package:front_end/infrastructure/commons/constants/image_constants.dart';
import 'package:front_end/infrastructure/providers/provider_registration.dart';
import 'package:front_end/infrastructure/utills/route_constants.dart';
import 'package:front_end/ui/commons/text_widget/app_text.dart';
import 'package:front_end/ui/screens/home/screens/widgets/home_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_end/ui/screens/home/widgets/date_range_picker_tile.dart';
import 'package:intl/intl.dart';


class DetailsScreen extends ConsumerStatefulWidget {
  const DetailsScreen({super.key});

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {

  DateTime rangeStartDate = DateTime.now();
  DateTime rangeEndDate = DateTime.now().add(const Duration(days: 2));

  void updateDateRange(DateTime startDate, DateTime endDate) {
    setState(() {
      rangeStartDate = startDate;
      rangeEndDate = endDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(ref.watch(homeProvider).recentData);
    print(data[ref.watch(homeProvider).recentData]);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFFFFFFFF),
            elevation: 0.0,
            expandedHeight: 250,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: data[ref.watch(homeProvider).recentData]['displayImage'] ?? '',
                child: Image.network(
                  data[ref.watch(homeProvider).recentData]['displayImage'] ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              collapseMode: CollapseMode.parallax,
            ),

            // title: Text("my app"),
            leading: Padding(
              padding: EdgeInsets.all(7),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(14.0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: const Color(0xFFFFFFFF)),
                  child: SvgPicture.asset(
                    ImageConstants.backIcon,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),    
            ),
            actions: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(11.0),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: const Color(0xFFFFFFFF)),
                    child: SvgPicture.asset(
                      ImageConstants.shareIcon,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.all(11.0),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: const Color(0xFFFFFFFF)),
                    child: SvgPicture.asset(
                      ImageConstants.wishlistsIcon,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  const SizedBox(width: 24),
                ],
              )
            ],
          ),
          // buildImage(),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: data[ref.watch(homeProvider).recentData]['cardName'] ?? '',
                    // "Villa Leelawadee - With Phang Nga Bay View",
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      SvgPicture.asset(ImageConstants.startIcon, height: 14),
                      const SizedBox(width: 4),
                      AppText(
                        title: data[ref.watch(homeProvider).recentData]['cardrating'] ?? '',
                        // "5.0.",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      const AppText(
                        title: ' reviews',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        textDecoration: TextDecoration.underline,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const AppText(
                    title: 'Tambon Si Sunthon, Chang Wat Phuket,',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    textDecoration: TextDecoration.underline,
                  ),
                  const SizedBox(height: 24),
                  const Divider(
                    color: Colors.black,
                  ),
                  const SizedBox(height: 24),
                  const AppText(
                    title: "Entire villa hosted by Silvan",
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 8),
                  const AppText(
                    title: '15 guests · 5 bedrooms · 5 beds · 4.5 bathrooms',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(height: 24),
                  const Divider(
                    color: Colors.black,
                  ),
                  const SizedBox(height: 24),
                  const IconWithTwoText(
                    icon: ImageConstants.selfCheckinIcon,
                    textOne: 'Self check-in',
                    textTwo: "You can check in with the doorperson.",
                  ),
                  const SizedBox(height: 24),
                  const IconWithTwoText(
                    icon: ImageConstants.driveRightIcon,
                    textOne: 'Dive right in',
                    textTwo: "This is one of the few places in the area with a pool.",
                  ),
                  const SizedBox(height: 24),
                  const IconWithTwoText(
                    icon: ImageConstants.experienceIcon,
                    textOne: 'Experienced host',
                    textTwo: "Silvan has 80 reviews for other places.",
                  ),
                  const SizedBox(height: 24),
                  const Divider(color: Colors.black),
                  const SizedBox(height: 24),
                  Image.network('https://a0.muscache.com/im/pictures/54e427bb-9cb7-4a81-94cf-78f19156faad.jpg', height: 40),
                  const SizedBox(height: 22),
                  const AppText(
                    title:
                        "Every booking includes free protection from Host cancellations, listing inaccuracies, and other issues like trouble checking in.",
                    fontSize: 14,
                    overflow: TextOverflow.visible,
                    titleColor: Color(0xFF222222),
                  ),
                  const SizedBox(height: 16),
                  const AppText(
                    title: "Learn more",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    textDecoration: TextDecoration.underline,
                  ),
                  const SizedBox(height: 24),
                  const Divider(color: Colors.black),
                  const SizedBox(height: 24),
                  const AppText(
                    title:
                        'With a general modern and minimalist design, Villa Leelawadee offers a tranquil place for you to unwind and just enjoy the spoils of nature. Purify your body and mind from all the hustle and bustle of the city life.',
                    fontSize: 16,
                    overflow: TextOverflow.visible,
                    titleColor: Color(0xFF222222),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const AppText(
                        title: "Show more",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        textDecoration: TextDecoration.underline,
                      ),
                      const SizedBox(width: 4),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Transform.rotate(
                          angle: -3.14 / 1,
                          child: SvgPicture.asset(
                            ImageConstants.backIcon,
                            width: 18,
                            height: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Divider(color: Colors.black),
                  const SizedBox(height: 24),
                  const AppText(
                    title: 'What this place offers',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 24),
                  const IconWithText(
                    icon: ImageConstants.seaViewIcon,
                    text: 'Ocean view',
                  ),
                  const SizedBox(height: 16),
                  const IconWithText(
                    icon: ImageConstants.seaViewIcon,
                    text: 'Sea view',
                  ),
                  const SizedBox(height: 16),
                  const IconWithText(
                    icon: ImageConstants.seaViewIcon,
                    text: 'Waterfront',
                  ),
                  const SizedBox(height: 16),
                  const IconWithText(
                    icon: ImageConstants.kitchenIcon,
                    text: 'Kitchen',
                  ),
                  const SizedBox(height: 16),
                  const IconWithText(
                    icon: ImageConstants.wifiIcon,
                    text: 'Wifi',
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: const AppText(
                      titleTextAlign: TextAlign.center,
                      title: "Show all 78 amenities",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(color: Colors.black),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xFFDDDDDD)))),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 80,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)
                    )),
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return DateRangePickerWidget(
                      onDateRangeSelected: updateDateRange,
                    );
                  },
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: '\$${data[ref.watch(homeProvider).recentData]['cardPrice'] ?? ''}',
                    // "₹95,590 night",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  AppText(
                    // title: data[ref.watch(homeProvider).recentData]['cardDate'] ?? '',
                    // '25–30 Mar',
                    title: '${DateFormat('dd').format(rangeStartDate)} - ${DateFormat('dd MMMM').format(rangeEndDate)}',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    titleColor: Color(0xFF000000),
                    textDecoration: TextDecoration.underline,
                  )
                ],
              )
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteConstants.confirmScreen);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFBE1A1F),
                ),
                child: const AppText(
                  title: "Reserve",
                  fontSize: 16,
                  titleColor: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Widget buildImage() => SliverToBoxAdapter(
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const AppText(
//               title:
//                   // data[ref.watch(homeProvider).recentData]['cardPrice'] ?? '',
//                   "Villa Leelawadee - With Phang Nga Bay View",
//               fontSize: 26,
//               fontWeight: FontWeight.w600,
//               overflow: TextOverflow.visible,
//             ),
//             const SizedBox(height: 14),
//             Row(
//               children: [
//                 SvgPicture.asset(ImageConstants.startIcon, height: 14),
//                 const SizedBox(width: 4),
//                 const AppText(
//                   title: "5.0.",
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 const AppText(
//                   title: ' 6 reviews',
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600,
//                   textDecoration: TextDecoration.underline,
//                 )
//               ],
//             ),
//             const SizedBox(height: 10),
//             const AppText(
//               title: 'Tambon Si Sunthon, Chang Wat Phuket,',
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               textDecoration: TextDecoration.underline,
//             ),
//             const SizedBox(height: 24),
//             const Divider(
//               color: Colors.black,
//             ),
//             const SizedBox(height: 24),
//             const AppText(
//               title: "Entire villa hosted by Silvan",
//               fontSize: 22,
//               fontWeight: FontWeight.w600,
//             ),
//             const SizedBox(height: 8),
//             const AppText(
//               title: '15 guests · 5 bedrooms · 5 beds · 4.5 bathrooms',
//               fontSize: 16,
//               fontWeight: FontWeight.w400,
//             ),
//             const SizedBox(height: 24),
//             const Divider(
//               color: Colors.black,
//             ),
//             const SizedBox(height: 24),
//             const IconWithTwoText(
//               icon: ImageConstants.selfCheckinIcon,
//               textOne: 'Self check-in',
//               textTwo: "You can check in with the doorperson.",
//             ),
//             const SizedBox(height: 24),
//             const IconWithTwoText(
//               icon: ImageConstants.driveRightIcon,
//               textOne: 'Dive right in',
//               textTwo: "This is one of the few places in the area with a pool.",
//             ),
//             const SizedBox(height: 24),
//             const IconWithTwoText(
//               icon: ImageConstants.experienceIcon,
//               textOne: 'Experienced host',
//               textTwo: "Silvan has 80 reviews for other places.",
//             ),
//             const SizedBox(height: 24),
//             const Divider(color: Colors.black),
//             const SizedBox(height: 24),
//             Image.network('https://a0.muscache.com/im/pictures/54e427bb-9cb7-4a81-94cf-78f19156faad.jpg', height: 40),
//             const SizedBox(height: 22),
//             const AppText(
//               title:
//                   "Every booking includes free protection from Host cancellations, listing inaccuracies, and other issues like trouble checking in.",
//               fontSize: 14,
//               overflow: TextOverflow.visible,
//               titleColor: Color(0xFF222222),
//             ),
//             const SizedBox(height: 16),
//             const AppText(
//               title: "Learn more",
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               textDecoration: TextDecoration.underline,
//             ),
//             const SizedBox(height: 24),
//             const Divider(color: Colors.black),
//             const SizedBox(height: 24),
//             const AppText(
//               title:
//                   'With a general modern and minimalist design, Villa Leelawadee offers a tranquil place for you to unwind and just enjoy the spoils of nature. Purify your body and mind from all the hustle and bustle of the city life.',
//               fontSize: 16,
//               overflow: TextOverflow.visible,
//               titleColor: Color(0xFF222222),
//             ),
//             const SizedBox(height: 16),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const AppText(
//                   title: "Show more",
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600,
//                   textDecoration: TextDecoration.underline,
//                 ),
//                 const SizedBox(width: 4),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 4),
//                   child: Transform.rotate(
//                     angle: -3.14 / 1,
//                     child: SvgPicture.asset(
//                       ImageConstants.backIcon,
//                       width: 18,
//                       height: 18,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//             const Divider(color: Colors.black),
//             const SizedBox(height: 24),
//             const AppText(
//               title: 'What this place offers',
//               fontSize: 22,
//               fontWeight: FontWeight.w600,
//             ),
//             const SizedBox(height: 24),
//             const IconWithText(
//               icon: ImageConstants.seaViewIcon,
//               text: 'Ocean view',
//             ),
//             const SizedBox(height: 16),
//             const IconWithText(
//               icon: ImageConstants.seaViewIcon,
//               text: 'Sea view',
//             ),
//             const SizedBox(height: 16),
//             const IconWithText(
//               icon: ImageConstants.seaViewIcon,
//               text: 'Waterfront',
//             ),
//             const SizedBox(height: 16),
//             const IconWithText(
//               icon: ImageConstants.kitchenIcon,
//               text: 'Kitchen',
//             ),
//             const SizedBox(height: 16),
//             const IconWithText(
//               icon: ImageConstants.wifiIcon,
//               text: 'Wifi',
//             ),
//             const SizedBox(height: 30),
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
//               width: double.maxFinite,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: Colors.black),
//               ),
//               child: const AppText(
//                 titleTextAlign: TextAlign.center,
//                 title: "Show all 78 amenities",
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(height: 24),
//             const Divider(color: Colors.black),
//             const SizedBox(height: 24),
//           ],
//         ),
//       ),
//     );

class IconWithTwoText extends StatelessWidget {
  final String icon;
  final String textOne;
  final String textTwo;

  const IconWithTwoText({super.key, required this.icon, required this.textOne, required this.textTwo});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, height: 24),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              title: textOne,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 90,
              child: AppText(
                title: textTwo,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                titleColor: const Color(0xFF717171),
                overflow: TextOverflow.visible,
              ),
            )
          ],
        )
      ],
    );
  }
}

class IconWithText extends StatelessWidget {
  final String icon;
  final String text;
  const IconWithText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, height: 24),
        const SizedBox(width: 16),
        AppText(
          title: text,
          fontSize: 16,
          titleColor: const Color(0xFF222222),
        )
      ],
    );
  }
}
