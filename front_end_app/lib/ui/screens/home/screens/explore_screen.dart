import 'dart:ui';

import 'package:front_end/infrastructure/commons/constants/image_constants.dart';
import 'package:front_end/infrastructure/providers/provider_registration.dart';
import 'package:front_end/ui/commons/text_widget/app_text.dart';
import 'package:front_end/ui/screens/home/screens/widgets/home_bottom_sheet.dart';
import 'package:front_end/ui/screens/home/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ExploreScreen extends ConsumerStatefulWidget {
  const ExploreScreen({super.key});
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(10.8230989, 106.6296638),
    zoom: 14.4746,
  );
  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  GoogleMapController? mapController;

  String? customStyle;
  @override
  void initState() {
    super.initState();
    loadMapStyle();
  }

  Future<void> loadMapStyle() async {
    customStyle = await rootBundle.loadString('assets/custom_map_style.json');
  }

  final panelController = PanelController();
  final _scrollController = ScrollController();

  bool isBottomSheetOpen = true;
  // int isTopNavbarSelected = 0;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final homeProviderWatch = ref.watch(homeProvider);
    final homeProviderRead = ref.read(homeProvider);
    final bool hasTopNotch = MediaQuery.of(context).padding.top > 24.0;

    final maxHeight = MediaQuery.of(context).size.height * (0.82);
    final minHeight = MediaQuery.of(context).size.height * (hasTopNotch ? 0.09 : 0.12);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // body: Container(
      //     margin: const EdgeInsets.only(top: 60),
      //     // padding: const EdgeInsets.symmetric(horizontal: 24),
      //     child: Stack(
      //       children: [
      //         homeProviderWatch.isBottomBarVisible
      //             ? ListView(
      //                 children: [
      //                   Column(
      //                     children: const [
      //                       SizedBox(height: 30),
      //                       HomeCard(
      //                         displayImage:
      //                             'https://a0.muscache.com/im/pictures/miso/Hosting-605371928419351152/original/c8f48e8b-091d-47ea-85ac-b31bc2604bbb.jpeg?im_w=720',
      //                         cardName: "Pimplad Nasik, India",
      //                         cardDistance: "134 kilometres away",
      //                         cardDate: "12–19 Mar",
      //                         cardPrice: "₹20,697 ",
      //                         cardrating: '6',
      //                       ),
      //                       HomeCard(
      //                         displayImage:
      //                             'https://a0.muscache.com/im/pictures/miso/Hosting-605371928419351152/original/c8f48e8b-091d-47ea-85ac-b31bc2604bbb.jpeg?im_w=720',
      //                         cardName: "Pimplad Nasik, India",
      //                         cardDistance: "134 kilometres away",
      //                         cardDate: "12–19 Mar",
      //                         cardPrice: "₹20,697 ",
      //                         cardrating: '6',
      //                       ),
      //                     ],
      //                   ),
      //                 ],
      //               )
      //             : const SizedBox.shrink(),
      //         const SearchWidget(),
      //       ],
      //     )

      //     )

      body: Stack(
        children: [
          SlidingUpPanel(
            controller: panelController,
            onPanelSlide: (position) {
              homeProviderRead.changeMapButtonVisible(position);
            },
            defaultPanelState: isBottomSheetOpen ? PanelState.OPEN : PanelState.CLOSED,
            body: Container(
                // color: Colors.red,
                color: const Color(0xFFFFFFFF),
                child: Stack(
                  children: [
                    Positioned(
                      top: hasTopNotch ? 230 : 190,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height - 200,
                        width: MediaQuery.of(context).size.width,
                        child: GoogleMap(
                          onMapCreated: (GoogleMapController controller) {
                            mapController = controller;
                            mapController?.setMapStyle(customStyle);
                          },
                          initialCameraPosition: ExploreScreen._kGooglePlex,
                        ),
                      ),
                    ),
                  ],
                )),
            maxHeight: maxHeight,
            minHeight: minHeight,
            panelBuilder: (controller) => HomeBottomSheet(
              panelController: panelController,
              controller: controller,
            ),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
          ),
          Positioned(
            child: Container(
              // height : 229
              height: hasTopNotch ? 229 : 196,
              color: const Color(0xFFFFFFFF),
            ),
          ),
          Positioned(
              top: hasTopNotch ? 154 : 116,
              right: 0,
              left: 0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                child: Container(
                  height: 74,
                  color: const Color(0xFFFFFFFF),
                  child: Row(
                    children: [
                      const SizedBox(width: 24),
                      for (var i = 0; i < data.length; i++)
                        GestureDetector(
                          onTap: () {
                            homeProviderRead.setHomeSelectionSlider(i);
                            setState(() {
                              _selectedIndex = i;
                              _scrollController.animateTo(
                                _selectedIndex * 90.0, // Container width + margin
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            });
                            // setState(() {
                            //   isTopNavbarSelected = i;
                            // });

                            // setState(() {
                            //   _selectedIndex = i;
                            //   if (_selectedIndex == 0) {
                            //     _scrollController.animateTo(
                            //       0,
                            //       duration: Duration(milliseconds: 500),
                            //       curve: Curves.easeInOut,
                            //     );
                            //   } else if (_scrollController.position.maxScrollExtent - _scrollController.position.pixels >=
                            //       (_selectedIndex - 1) * 120.0) {
                            //     _scrollController.animateTo(
                            //       (_selectedIndex - 1) * 120.0,
                            //       duration: Duration(milliseconds: 500),
                            //       curve: Curves.easeInOut,
                            //     );
                            //   }
                            // });

                            // setState(() {
                            //   _selectedIndex = i;
                            //   double newPosition = (_selectedIndex * 110.0) - (MediaQuery.of(context).size.width / 2) + 55.0;
                            //   _scrollController.animateTo(
                            //     newPosition,
                            //     duration: Duration(milliseconds: 500),
                            //     curve: Curves.easeInOut,
                            //   );
                            // });

                            // setState(() {
                            //   _selectedIndex = i;
                            //   final newScrollPosition = _selectedIndex * 80.0;
                            //   if (newScrollPosition > _scrollController.position.maxScrollExtent) {
                            //     _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                            //   } else {
                            //     _scrollController.animateTo(
                            //       newScrollPosition,
                            //       duration: Duration(milliseconds: 500),
                            //       curve: Curves.easeInOut,
                            //     );
                            //   }
                            // });
                          },
                          child: TopNavBarSelectionWidget(
                            title: data[i]['title'] ?? '',
                            icon: data[i]['icon']!,
                            isSelected: homeProviderWatch.homeSelectionSlider == i ? true : false,
                          ),
                        )
                    ],
                  ),
                ),
              )),
          // Blurred container
          Visibility(
            visible: !homeProviderWatch.isBottomBarVisible,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color(0xFFFFFFFF).withOpacity(0.9),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                child: Container(),
              ),
            ),
          ),
          Positioned(
            child: Container(
              padding: const EdgeInsets.only(top: 0),
              child: const SearchWidget(),
            ),
          ),
          if (homeProviderWatch.isBottomBarVisible)
            Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedOpacity(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 50),
                  opacity: homeProviderWatch.isMapButtonVisible > 0.99
                      ? homeProviderWatch.isMapButtonVisible
                      : homeProviderWatch.isMapButtonVisible / 5,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isBottomSheetOpen = false;
                        panelController.close();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 84),
                      width: 74,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFF222222)),
                      child: Row(children: [
                        const AppText(
                          title: "Map",
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          titleColor: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        SvgPicture.asset(
                          ImageConstants.mapIcon,
                          color: Colors.white,
                          height: 16,
                          width: 16,
                        ),
                      ]),
                    ),
                  ),
                )),
        ],
      ),
    );
  }
}

class TopNavBarSelectionWidget extends ConsumerStatefulWidget {
  final String title;
  final String icon;
  final bool isSelected;
  const TopNavBarSelectionWidget({super.key, required this.title, required this.icon, required this.isSelected});

  @override
  ConsumerState<TopNavBarSelectionWidget> createState() => _TopNavBarSelectionWidgetState();
}

class _TopNavBarSelectionWidgetState extends ConsumerState<TopNavBarSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      // curve: Curves.easeInOut,
      // transform: Matrix4.translationValues(
      //   ref.watch(homeProvider).homeSelectionSlider * -80.0, // Container width + margin
      //   0,
      //   0,
      // ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        // color: Colors.blueAccent,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: widget.isSelected ? Colors.black : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.icon,
              height: 24,
              width: 24,
              fit: BoxFit.contain,
              color: widget.isSelected ? const Color(0xFF000000) : const Color(0xFF5C5C5C),
            ),
            const SizedBox(height: 4),
            AppText(
              title: widget.title,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              titleColor: widget.isSelected ? const Color(0xFF000000) : const Color(0xFF717171),
            )
          ],
        ),
      ),
    );
  }
}

const data = [
  {
    "title": "Omg!",
    "icon": ImageConstants.omgIcon,
  },
  {
    "title": "Treehouses",
    "icon": ImageConstants.treeHouseIcon,
  },
  {
    "title": "Private rooms",
    "icon": ImageConstants.privateRoomsIcon,
  },
  {
    "title": "Amazing pools",
    "icon": ImageConstants.amazingPooolIcon,
  },
  {
    "title": "A-frames",
    "icon": ImageConstants.aFramesIcon,
  },
  {
    "title": "Amazing views",
    "icon": ImageConstants.amazingViewIcon,
  },
  {
    "title": "Luxe",
    "icon": ImageConstants.luxeIcon,
  },
  {
    "title": "Farms",
    "icon": ImageConstants.farmsIcon,
  },
  {
    "title": "Tiny homes",
    "icon": ImageConstants.tinyHomesIcon,
  },
  {
    "title": "Trending",
    "icon": ImageConstants.trendingIcon,
  },
  {
    "title": "Casas particulares",
    "icon": ImageConstants.casasaParticularesIcon,
  },
  {
    "title": "Mansions",
    "icon": ImageConstants.mansionIcon,
  },
  {
    "title": "Historical homes",
    "icon": ImageConstants.historicalHomes,
  },
  {
    "title": "Tropical",
    "icon": ImageConstants.tropicalIcon,
  },
  {
    "title": "Beachfront",
    "icon": ImageConstants.beachfronrIcon,
  },
  {
    "title": "Bed & breakfasts",
    "icon": ImageConstants.bedBreakfastIcon,
  },
];
